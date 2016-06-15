module BookKeeping
  VERSION=2
end

class Binary

  def initialize(string)
    @string = string
    indexed_bits = @string.chars.reverse.each_with_index
    @decimal = indexed_bits.reduce(0) do |memo,c|
      bit, index = c
      case bit
      when '1'
      	memo | (1 << (index)) 
      when '0'
      	memo
      else
      	raise ArgumentError
      end
    end

  end

  def to_decimal
    @decimal
  end

end