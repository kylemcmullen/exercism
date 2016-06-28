module Enumerable
  def keep(&block)
  	out = []
    each do |elem|
      out << elem if block.call(elem)
    end

    return out
  end

  def discard(&block)
  	out = []
    each do |elem|
      out << elem unless block.call(elem)
    end

    return out    
  end
end
