require './dynamic_methods.rb'
require 'ruby-prof'

def save(printer)
  f = File.open("profile_dynamic_methods-#{Time.now.strftime("%Y-%m-%d_%I%M%S")}.html", "w")
  printer.print(f, print_file: true, min_percent: 1)
  f.close
end

def execute
  a = MySubclass.new
  b = CEClass.new
  c = DMClass.new

  # set profile mode
  # RubyProf.measure_mode = RubyProf::WALL_TIME
  # RubyProf.measure_mode = RubyProf::PROCESS_TIME
  # RubyProf.measure_mode = RubyProf::CPU_TIME
  # RubyProf.measure_mode = RubyProf::ALLOCATIONS
  RubyProf.measure_mode = RubyProf::MEMORY
  # RubyProf.measure_mode = RubyProf::GC_TIME
  # RubyProf.measure_mode = RubyProf::GC_RUNS
  # profile the code
  # profile the code
  result = RubyProf.profile do
    # ... code to profile ...
    100.times do
      # a.my_method
      # b.my_method
      c.my_method
    end
  end
  printer = RubyProf::GraphHtmlPrinter.new(result)
  save(printer)
end

execute()
