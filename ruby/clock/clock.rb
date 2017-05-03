require 'time'

class Clock
  def self.at(hours, minutes)
    ClockTime.instance(hours, minutes)
  end
end

class ClockTime
  attr_accessor :hours, :minutes, :clock_time, :total_minutes

  @@instance = nil

  def self.instance(hours, minutes)
    return @@instance if @@instance && self.same_time?(hours, minutes)
    @@instance = new(hours, minutes)
  end

  def to_s
    clock_time.strftime('%R')
  end

  def +(minutes)
    self.total_minutes += minutes
    set_time
    self
  end

  private

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    @total_minutes = self.class.to_minutes(hours, minutes)
    @clock_time = nil

    set_time
  end

  def set_time
    time = self.class.get_time_string(total_minutes)

    self.clock_time = Time.parse(time)
  end

  def self.to_minutes(hours, minutes)
    hours * 60 + minutes
  end

  def self.get_time_string(total_minutes)
    clock_hours = total_minutes / 60 % 24
    clock_minutes = total_minutes % 60

    "#{clock_hours}:#{clock_minutes}"
  end

  def self.same_time?(hours, minutes)
    get_time_string(to_minutes(hours, minutes)) ==
      get_time_string(@@instance.total_minutes)
  end
end

module BookKeeping
  VERSION = 2
end
