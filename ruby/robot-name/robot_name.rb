module BookKeeping
  VERSION = 2
end

class RobotNameFactory
  
  def self.assign_name
    # TODO something if all names are taken...
    robot_name = nil
    loop do
      robot_name = rand_alpha_string(2) + rand_numeric_string(3)
      break unless MEMORY[robot_name]
    end
    MEMORY[robot_name] = true
    return robot_name
  end

  private

  MEMORY = {}

  ALPHA_RANGE = ('A'..'Z').to_a

  def self.rand_alpha_string(length)
   string = ''

   length.times do 
     alpha_index = rand(ALPHA_RANGE.size).floor
     string += ALPHA_RANGE[alpha_index]
   end

   return string
  end

  def self.rand_numeric_string(digits)
   s = rand(10 ** digits).floor.to_s
   s += '0'* (digits - s.size)
   return s 
  end

end

class Robot
  attr_reader :name

  def initialize
    @name = RobotNameFactory.assign_name
  end

  def reset
    @name = RobotNameFactory.assign_name
  end
end
