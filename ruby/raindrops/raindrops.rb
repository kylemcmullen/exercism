module BookKeeping
  VERSION=2
end
module Raindrops
  #VERSION=2  
  
  CONVERSIONS = [
    [3 , 'Pling'],
    [5 , 'Plang'],
    [7 , 'Plong']
  ]

  def self.convert(n)

    convert_n = Proc.new { |conversion| do_conversion(n, conversion) }
 
    converted = CONVERSIONS.map(&convert_n).join('')

    if converted == ""
      return n.to_s
    else
      return converted
    end

  end

  private

  def self.do_conversion(n,conversion)
    n % conversion[0] == 0 ? conversion[1] : ""
  end
end
