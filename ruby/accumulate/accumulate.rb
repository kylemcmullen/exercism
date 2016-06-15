module Enumerable

  def accumulate(&block)
  	self.map do |elem| 
      yield elem
    end
  end

end