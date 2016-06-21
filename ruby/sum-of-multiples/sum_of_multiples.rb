class SumOfMultiples

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(n)
    (0...n).select(&method(:multiple?)).inject(:+)
  end

  private

  def multiple?(i)
    @numbers.any? do |number|
      i % number == 0
    end
  end

end