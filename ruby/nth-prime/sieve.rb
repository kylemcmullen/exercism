class Sieve

  attr_reader :primes

  def initialize(n)
    @primes = []
    
    if n >= 2
      # possible primes are all numbers less than n
      possible_primes = 2.upto(n).to_a
    
      until possible_primes.empty?
        # add next discovered prime
        prime = possible_primes.shift
        @primes << prime
        # remove all multiples of the prime
        i = prime * 2
        while i <= n
          possible_primes -= [i]
          i+=prime
        end
      end
    end
  end

end
