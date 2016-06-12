module BookKeeping
  VERSION=4
end
module Complement

  #VERSION=4

  COMPLEMENT_MAP = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }


  def self.of_dna(strand)
    strand.chars.map(&method(:complement)).join('')
  rescue InvalidNucleotideException
    return ''
  end

  private

  def self.complement(char)
    c = COMPLEMENT_MAP[char]
    if c == nil
      raise InvalidNucleotideException.new
    else
      return c
    end
  end
  
  class InvalidNucleotideException < ArgumentError
    
  end
end
