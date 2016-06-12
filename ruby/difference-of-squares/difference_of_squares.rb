module BookKeeping
  VERSION = 3
end
class Squares 

  attr_reader :sum_of_squares, :square_of_sum, :difference

  def initialize(n)
    @n = n
    @sum_of_squares = _sum_of_squares(n)
    @square_of_sum = _square_of_sum(n)
    @difference = @square_of_sum - @sum_of_squares
  end

  private

  def _sum_of_squares(n)
    (n*(n+1)*(2*n+1))/6
  end

  def _square_of_sum(n)
    (n*(n+1)/2)**2
  end

end
