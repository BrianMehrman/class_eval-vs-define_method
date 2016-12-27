# Defines the methods normally
module Foo
  def my_method
    'module method'
  end
end
# Defines the methods using class_eval
module ClassFoo
  class_eval <<-RUBY
    def my_method
      'Class evaluated method'
    end
  RUBY
end

# Defines the methods using define_method
module DefineFoo
  define_method 'my_method' do
    'Define method method'
  end
end

# Defines a method that uses a block to get its job done
module BlockFoo
  class_eval <<-RUBY
    def my_method
      yield
    end
  RUBY
end

# Define method with a Proc
module ProcFoo
  P = proc { 'proc method' }
  def my_method
    P.call
  end
end

# Base Class
class MyClass
  def yield_here
    yield
  end

  def my_method
    'class method'
  end
end

# Subclass normal methods
class MySubclass < MyClass
  include Foo
end

# class using class eval methods
class CEClass < MyClass
  include ClassFoo
end

# Class using define method methods
class DMClass < MyClass
  include DefineFoo
end

# Class using defined method methods but prepended
class PreDMClass < MyClass
  prepend DefineFoo
end

class ProcClass < MyClass
  include ProcFoo
end

class BlockClass < MyClass
  include BlockFoo
end

class InstanceEvalClass < MyClass
  def initialize
    self.instance_eval {
      def my_method
        "instance eval method"
      end
    }
  end
end
