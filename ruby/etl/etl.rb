module ETL
  def self.transform(old)
    transformed = {}
    old.each_pair do |points, letters|
      letters.each do |letter|
        transformed[letter.downcase] = points
      end
    end

    return transformed
  end
end