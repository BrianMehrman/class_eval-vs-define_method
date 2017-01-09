require 'benchmark/ips'
require './dynamic_methods.rb'
a = MySubClass.new
b = CEClass.new
c = DMClass.new
d = PreDMClass.new
e = BlockClass.new
f = ProcClass.new
g = InstanceEvalClass.new

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(time: 5, warmup: 2)

  # These parameters can also be configured this way
  x.time = 5
  x.warmup = 2

  x.report('normal method') do
    a.my_method
  end

  x.report('class_eval method') do
    b.my_method
  end

  x.report('define_method method') do
    c.my_method
  end

  x.report('prepended define_method method') do
    d.my_method
  end

  x.report('block method') do
    e.my_method do
      # 'block method'
      'text'
    end
  end

  x.report('proc method') do
    f.my_method
  end

  x.report('instance eval method') do
    g.my_method
  end

  x.compare!
end
