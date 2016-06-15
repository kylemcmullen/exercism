class SumOfMultiples

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(n)
    (0...n).select(&method(:is_multiple?)).inject(:+)
  end

  private

  def is_multiple?(i)
    @numbers.each do |number|
      return true if i % number == 0
    end
    return false
  end

end