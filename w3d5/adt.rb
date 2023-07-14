class Stack
  def initialize
    # create ivar to store stack here!
    @stack = Array.new()
    @size = 0

  end

  def push(el)
    # adds an element to the stack
    @stack.push(el)
    @size+=1
  end

  def pop
    # removes one element from the stack
    if !@stack.empty?
      @stack.pop
      @size-=1
    end
    nil
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    if !@stack.empty?
      return @stack[-1]
    end
    nil
  end
end



# s = Stack.new()
# s.push(1)
# s.push(7)
# s.push(3)
# s.push(6)
# s.push(2)
# p s
# s.pop

# p s

# p s.peek

class Queue

  def initialize
    @queue = Array.new()
  end

  def enqueue(el) #enter
    @queue.push(el)
  end

  def dequeue
    if !@queue.empty?
      @queue.delete_at(0)
    end
    @queue
  end

  def peek
    if !@queue.empty?
      ele = @queue.shift
    end
    ele
  end

end


# q = Queue.new()

# q.enqueue(7)
# q.enqueue(4)
# q.enqueue(5)
# q.enqueue(2)
# q.enqueue(8)
# q.enqueue(1)

# p q
# q.dequeue
# p q
# q.dequeue
# p q

# p q.peek


class Map

  def initialize
    @map = Array.new(){Array.new()}
  end

  def get(key)
    if !@map.empty?
      (0...@map.length).each do |i|
        if @map[i][0] == key
          return @map[i][1]
        end
      end
      return  "no such a key"
    end

  end

  def set(key, value)
    if !@map.empty?
      (0...@map.length).each do |i|
        if @map[i][0] == key
          @map[i][1] = value
        end
      end
      @map<<[key, value]
    else
      @map<<[key, value]
    end

  end


  def delete(key)
    if !@map.empty?
      (0...@map.length).each do |i|
        if @map[i][0] == key
          @map.delete_at(i)
        end
      end
      p "key not exit"
    end
    @map
  end

  def show
    p @map
  end

end

# m = Map.new

# m.set(1,"h")
# m.set(4,"e")
# m.set(6,"l")
# m.set(5,"o")

# # p m

# # p m.get(5)
# p m.get(7)

# p m.delete(5)

# m.show
