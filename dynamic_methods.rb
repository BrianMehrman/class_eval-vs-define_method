# Defines the methods normally
module Foo
  def my_method
    "text"
    # 'module method'
  end
end
# Defines the methods using class_eval
module ClassFoo
  class_eval <<-RUBY
    def my_method
      "text"
      # 'Class evaluated method'
    end
  RUBY
end

# Defines the methods using define_method
module DefineFoo
  define_method 'my_method' do
    "text"
    # 'Define method method'
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
  def my_method
    "text"
    # 'class method'
  end
end

# Subclass normal methods
class MySubClass < MyClass
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
        "text"
        # "instance eval method"
      end
    }
  end
end
