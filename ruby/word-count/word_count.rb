module BookKeeping
  VERSION=1
end

class Phrase
  
  attr_reader :word_count
  
  def initialize(phrase)
    @context = :outside_word
    @word_count = Hash.new(0)
    phrase.downcase.chars.each do |char|
      if word_char?(char)
        @context = :inside_word
        append_to_word(char)
      else
        @context = :outside_word
        count_current_word
      end
    end

    end_phrase

    @word_count.freeze
  end

  private

  def end_phrase
    @context = :end_of_phrase
    count_current_word
  end

  def count_current_word
    if exiting_word?
      if unbound_quote?
        @current_word.chomp!("'")
      end
      @word_count[@current_word] += 1
      reset_word
    end    
  end

  def append_to_word(char)
    if @current_word.nil?
      @current_word = char
    else
      @current_word += char
    end
  end

  def reset_word
    @current_word = nil
  end

  def exiting_word?
    (@context == :outside_word || @context == :end_of_phrase) && @current_word != nil
  end

  def in_word?
    @context == :inside_word
  end

  def unbound_quote?
    @current_word[-1].eql?("'")
  end

  def word_char?(char)
    case char
    when /\w/
        true
    when "'"
        @context == :inside_word
    else
        false
    end
  end
end

