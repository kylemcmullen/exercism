module BookKeeping
  VERSION = 2
end
module Pangram
  ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  
  def self.is_pangram?(s)
    (ALPHABET - s.downcase.chars).empty? 
  end
end
