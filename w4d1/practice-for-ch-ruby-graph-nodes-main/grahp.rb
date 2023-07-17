class GraphNode

  attr_accessor :val, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def bfs(starting_node, target_value)
    queue = []
    used = []
    queue<<starting_node
    while queue.length >0
      while used.include?(curr)
        curr = queue.shift
        used<<curr
      end
      if curr.value == target_value
        return curr
      else
        queue += neighbors
      end
    end
    nil
  end


end
