require 'benchmark'
require File.expand_path('../max_subarray', __FILE__)

def random_array
  length = 500
  range_min = -10
  range_max = 10
  length.times.map{ range_min + Random.rand(range_max - range_min + 1) } 
end

def random_test
  number_of_tests = 100

  Benchmark.bm(number_of_tests) do |x|
    a = random_array
    result = []
    x.report("n_cubed") { result << MaxSubarray.n_cubed(a)}
    x.report("n_squared") { result << MaxSubarray.n_squared(a)}
    x.report("dp") { result << MaxSubarray.dp(a)}
    if result.min != result.max
      raise "Algorithms are returning different max\nArray: #{a}\nmax: #{result}"
    end
  end
  puts
end

random_test

# Benchmark results:
# length = 500
# range_min = -10
# range_max = 10
# number_of_tests = 100
#                        user     system      total        real
# n_cubed            3.990000   0.010000   4.000000 (  4.001422)
# n_squared          0.030000   0.000000   0.030000 (  0.027897)
# dp                 0.000000   0.000000   0.000000 (  0.001317)
