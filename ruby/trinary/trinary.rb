class Trinary
  def initialize(string)
    @trinary = string
    digits_with_index = string.reverse.chars.each_with_index
    @value = digits_with_index.inject(0) do |memo,digit_with_index|
      digit, index = digit_with_index
      case digit
      when '0'
        memo
      when '1'
        memo += (3 ** index)
      when '2'
        memo += 2* (3 ** index)
      else
        raise ArgumentError
      end
    end
  rescue ArgumentError
    @value = 0
  end

  def to_decimal
    @value
  end
end