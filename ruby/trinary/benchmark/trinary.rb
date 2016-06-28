class Trinary
  def initialize(string)
    @trinary = string
    @value = 0

    power = 1
    for index in (string.length - 1).downto(0)
      digit = string[index]
      case digit
      when '0'
        # no-op        
      when '1'
        @value += power  
      when '2'
        @value += power + power  
      else
        raise ArgumentError.new("saw a \"#{digit}\"")
      end
      power *= 3
    end
  rescue ArgumentError => e
    @value = 0
  end

  def to_decimal
    @value
  end
end