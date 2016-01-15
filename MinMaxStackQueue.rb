class MyQueue
  def intialize
    @store = []
  end

  def enqueue(*el)
    @store.concat(el)
  end

  def dequeue(n)
    @store.shift(n)
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def intialize
    @store = []
  end

  def push(*el)
    @store.concat(el)
  end

  def pop(n = 1)
    @store.pop(n)
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def <<(el) # TODO verify!
    push(el)
  end
end

class StackQueue

  def initialize
    @in_stack, @out_stack = MyStack.new, MyStack.new
  end

  def enqueue(el)
    @in_stack << {value: el,
                  min: min(@in_stack.peek[:min], el),
                  max: max(@in_stack.peek[:max], el)}
  end

  def dequeue
    @out_stack.empty? ? transfer_stacks : @out_stack.pop
  end

  def size
    @in_stack.length + @out_stack.length
  end

  def empty?
    @in_stack.empty && @out_stack.empty
  end

  def min # TODO also needs a nil check
    min(@in_stack.peek[:min], @out_stack.peek[:min])
  end

  def max
    max(@in_stack.peek[:max], @out_stack.peek[:max])
  end

  private

  def transfer_stacks
    until @in_stack.empty?
      moving_el = @in_stack.pop
      moving_el[:min] = min(@out_stack.peek[:min], moving_el[:value]) # TODO nil check
      moving_el[:max] = max(@out_stack.peek[:max], moving_el[:value])
      @out_stack << moving_el
    end
  end

end
