class Stack

  attr_accessor :stack

  def initialize
    @stack = []
  end

  def add(el)
    stack.push(el)
  end

  def remove
    stack.pop(el)
  end

  def show
    stack.dup
  end
end
