class Bob
  

  def hey(remark)
    classification = classify(remark)

    response(classification)
  end

  private

  def classify(remark)
    classification = nil
    if silence?(remark)
    	classification = :silence
    elsif question?(remark)
    	classification = :question
    elsif yelling?(remark)
    	classification = :yell
    else
      classification = :default
    end

    classification
  end

  def question?(remark)
    # Ends with question mark, not yelling, contains alpha characters
    (remark =~ /\?\Z/) && !yelling?(remark)
  end

  def silence?(remark)
    # String is empty or blank
    remark =~ /\A\s*\Z/
  end

  def yelling?(remark)
    # Contains word character and all word character are uppercase
    (remark =~ /[A-Z]/) && (remark !~ /[a-z]/)
  end

  def response(classification)
  	case classification
  	when :question
  		'Sure.'
  	when :yell
  		'Whoa, chill out!'
  	when :silence
  		'Fine. Be that way!'
  	else
  		'Whatever.'
  	end
  end
end