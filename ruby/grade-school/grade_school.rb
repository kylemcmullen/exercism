module BookKeeping
  VERSION=1
end
class School
  
  def initialize()
    @classes = []
  end

  def add(name,grade)
    klass = @classes[grade]
    unless klass
      klass = []
      @classes[grade] = klass
    end
    klass << name
  end

  def grade(grade)
  	grade = @classes[grade] || []

  	grade.sort
  end

  def to_h
  	classes_and_ranks = @classes.each_with_index
    out = classes_and_ranks.reduce(Hash.new([])) do |memo, class_and_rank|
      if class_and_rank[0]
        memo[class_and_rank[1]] = class_and_rank[0].sort
      end

      memo
    end

    out
  end

end