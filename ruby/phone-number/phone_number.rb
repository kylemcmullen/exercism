class PhoneNumber
  attr_reader :area_code, :number
  
  def initialize(number)
    @errors = []
    @digits = []
    for c in number.chars
      case c
      when /\d/
        @digits << c
      when '.'
      when '-'
      when '('
      when ')'
      when /\s/
        next
      else
        @errors << :bad_char
        break
      end
    end

    if @digits.size == 11
      digit = @digits.shift
      @errors << :bad_country_code if digit != '1'
    elsif @digits.size != 10
      @errors << :bad_length
    end

    unless @errors.empty?
      @digits = ['0'] * 10
    end

    @number = @digits.join.freeze
    @area_code = @digits[0..2].join.freeze
    @pretty = "(#{@digits[0..2].join}) #{@digits[3..5].join}-#{@digits[6..9].join}".freeze
  end

  def to_s
    @pretty
  end
end