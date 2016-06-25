require 'prime'
module PrimeFactors
  def self.for(n)
    Prime.prime_division(n).map {|f| [f[0]] * f[1]}.flatten
  end
end