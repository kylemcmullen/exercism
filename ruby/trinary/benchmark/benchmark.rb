require_relative 'trinary'
require_relative 'trinary_old'
require 'benchmark'
require 'randexp'

trinary_string =/(0|1|2){100000}/.gen 
old_result = nil
new_result = nil
reference = nil
Benchmark.bmbm do |x|
  x.report("old: ") { old_result = TrinaryOld.new(trinary_string).to_decimal }
  x.report("new: ") { new_result = Trinary.new(trinary_string).to_decimal }
  x.report("reference: ") { reference = trinary_string.to_i(3) }
end

puts "old vs. reference value: #{reference - old_result}"
puts "new vs. reference value: #{reference - new_result}"
puts "old vs. new value: #{old_result - new_result}"