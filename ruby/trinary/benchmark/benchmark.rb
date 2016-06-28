require_relative 'trinary'
require_relative 'trinary_old'
require 'benchmark'
require 'randexp'

trinary_string =/(0|1|2){100000}/.gen 

Benchmark.bmbm do |x|
  x.report("old: ") { TrinaryOld.new(trinary_string) }
  x.report("new: ") { Trinary.new(trinary_string) }
end