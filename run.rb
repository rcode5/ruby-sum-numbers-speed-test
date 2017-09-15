#!/usr/bin/env ruby

require 'benchmark'
require 'byebug'
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.4.0')
  require 'active_support/core_ext/enumerable'
end

class Summer
  def initialize(array)
    @a = array
    @sum = 0
  end

  def reset
    @sum = 0
  end

  def reduce
    @sum = @a.reduce(0) { |x,y| x+y }
  end

  def each_plus
    @a.each { |i| @sum += i }
    return @sum
  end

  def inject
    @sum = @a.inject :+
  end

  def sum
    @sum = @a.sum
  end
end


NUM_RUNS = 10000
array = Array.new(1000) { rand }
summer = Summer.new(array)
expected_value = array.sum
Benchmark.bm do |x|
  %i( reduce inject sum each_plus ).each do |method|
    x.report(method) do
      for i in 1..NUM_RUNS
        result = summer.send(method)
        raise "Your maths are wrong #{result} <=> #{expected_value}" if (result - expected_value).abs > 0.0000001
        summer.reset
      end
    end
  end
end
