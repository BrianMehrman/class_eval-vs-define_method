require './dynamic_methods.rb'

def report_instructions(method)
  RubyVM::InstructionSequence.disasm(method)
end

puts "\nNormal Method Instructions\n-----------------------"
puts report_instructions(MySubClass.new.method(:my_method))

puts "\nClass Eval Instructions   \n-----------------------"
puts report_instructions(CEClass.new.method(:my_method))

puts "\nDefine Method Instructions\n-----------------------"
puts report_instructions(DMClass.new.method(:my_method))

puts "\nBlock Technique Instructions\n-----------------------"
puts RubyVM::InstructionSequence.new('BlockClass.new.my_method do "text" end').disasm
