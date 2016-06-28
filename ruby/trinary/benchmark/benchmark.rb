require_relative 'trinary'
require_relative 'trinary_old'
require 'benchmark'
require 'randexp'

trinary_string =/(0|1|2){100000}/.gen 
old_result = nil
new_result = nil
Benchmark.bmbm do |x|
  x.report("old: ") { old_result = TrinaryOld.new(trinary_string) }
  x.report("new: ") { new_result = Trinary.new(trinary_string) }
end

puts old_result.to_decimal
puts '-----'
puts new_result.to_decimal
puts '-----'
puts old_result.to_decimal - new_result.to_decimal
puts '-----'
reference = trinary_string.to_i(3)
puts reference - old_result.to_decimal
puts reference - new_result.to_decimal