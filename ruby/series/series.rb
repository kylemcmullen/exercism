class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
  	raise ArgumentError if n > @string.size
    chars = @string.chars.map(&:to_i)
    _slices = []
    until chars.empty?
      t = [chars.shift] + chars.take(n-1)
      _slices << t if t.size == n
    end
    return _slices
  end
end