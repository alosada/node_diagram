
class Map

  attr_accessor :graph, :nodes

  def initialize(path)
    @graph = ''
    @nodes = []
  end

end

class Node

  attr_accessor :label, :connections

  def initialize(label)
    @label=label
    @connections = {}
  end

  def to_s
    label
  end

end

