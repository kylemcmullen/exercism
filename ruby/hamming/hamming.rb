module Hamming
  VERSION=2
  def self.compute(a,b)
  	raise ArgumentError if a.size != b.size
    a.chars.zip(b.chars).count do |a,b|
      a != b
    end
  end
end