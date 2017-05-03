module VerseBuilder
  class Builder
    attr_reader :bottles
    def initialize(bottles)
      @bottles = bottles
    end

    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def self.find_builder_for(bottles)
      self.descendants.find do |builder|
        builder.new(bottles).can_handle?
      end.new(bottles)
    end

    def template(bottles, action, bottles_left)
      "#{bottles} of beer on the wall, #{bottles.downcase} of beer.\n" \
      "#{action}, #{bottles_left} of beer on the wall.\n"
    end

    def can_handle?
    end
  end

  class ManyBottlesBuilder < Builder
    def can_handle?
      bottles > 2 && bottles <= 99
    end

    def build_verse
      template(
        "#{bottles} bottles",
        "Take one down and pass it around",
        "#{bottles - 1} bottles"
      )
    end
  end

  class TwoBottlesBuilder < Builder
    def can_handle?
      bottles == 2
    end

    def build_verse
      template(
        "#{bottles} bottles",
        "Take one down and pass it around",
        "1 bottle"
      )
    end
  end

  class OneBottleBuilder < Builder
    def can_handle?
      bottles == 1
    end

    def build_verse
      template(
        "#{bottles} bottle",
        "Take it down and pass it around",
        "no more bottles"
      )
    end
  end

  class ZeroBottleBuilder < Builder
    def can_handle?
      bottles == 0
    end

    def build_verse
      template(
        "No more bottles",
        "Go to the store and buy some more",
        "99 bottles"
      )
    end
  end
end

class BeerSong
  include VerseBuilder

  def verses(from, to)
    from_to_verses(from, to)
  end

  def verse(bottles)
    verse_of(bottles)
  end

  def lyrics
    from_to_verses(99, 0)
  end

  private

  def from_to_verses(from, to)
    from.downto(to).each_with_object("") do |bottles, verses|
      verse = verse_of(bottles)
      verse << "\n" unless bottles == to

      verses << verse
    end
  end

  def verse_of(bottles)
    Builder.find_builder_for(bottles).build_verse
  end
end

module BookKeeping
  VERSION = 2
end
