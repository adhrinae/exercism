module BookKeeping
  VERSION = 4
end

class Complement
  DNA_TO_RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  class << self
    def of_dna(dna)
      return '' unless valid?(dna)

      dna.chars.map do |e|
        DNA_TO_RNA[e]
      end.join
    end

    private

      def valid?(dna)
        dna.scan(/[^GCTA]/).empty?
      end
  end
end
