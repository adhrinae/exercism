class ETL
  def self.transform(old_system)
    new_system = {}

    old_system.each do |score, letters|
      letters.each do |letter|
        new_system[letter.downcase] = score
      end
    end

    new_system
  end
end
