module Enumerable

  def keep(&block)
    t = []
    self.each do |elem|
      t << elem if (yield elem)
    end
  end

  def discard(&block)
    self - self.keep(&block)
  end
end