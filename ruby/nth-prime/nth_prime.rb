class Sieve

  attr_reader :primes

  def initialize(n)
    @primes = []
    
    if n >= 2
      # possible primes are all numbers less than n
      @tested_max = n
      possible_primes = 2.upto(n).to_a
      
      continue_sieve(possible_primes)
    end
  end

  ## 
  # extend to primes double the last tested max
  def extend
    if @primes.empty?
      @tested_max = 1000
      possible_primes = Range.new(2, 1000).to_a

      continue_sieve(possible_primes)
    else
      possible_primes = Range.new(@tested_max, @tested_max * 2).to_a
      @tested_max *= 2
      
      # remove numbers that are multiples of primes less than this
      for prime in primes
        possible_primes.delete_if do |possible_prime|
          possible_prime % prime == 0
        end
      end

      continue_sieve(possible_primes)
    end
  end

  private

  ## 
  # This method assumes that the input array is an array where sieving has
  # left off with the next prime in the right position
  def continue_sieve(possible_primes)
    until possible_primes.empty?
      # add next discovered prime
      prime = possible_primes.shift
      @primes << prime
      # remove all multiples of the prime
      possible_primes.delete_if do |possible_prime|
        possible_prime % prime == 0
      end
      @max_prime = prime
    end
  end

end

class Prime

  SIEVE = Sieve.new(1000)

  def self.nth(n)
    raise ArgumentError.new("must be positive") if n <= 0
    nth_prime = SIEVE.primes[n-1]
    loop do
      break if nth_prime
      SIEVE.extend
      nth_prime = SIEVE.primes[n-1]
    end
    return nth_prime
  end

end