module Hamming
  VERSION=2
  def self.compute(a,b)
  	raise ArgumentError if a.size != b.size
    count=0
    a.chars.zip(b.chars).each do |a,b|
      count += 1 if a != b
    end
    return count
  end
end