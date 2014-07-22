
class Diagram

  attr_accessor :graph, :nodes

  def initialize(path)
    @link_string = ''
    @nodes = []
    link_string = File.open(path, 'r')
    link_string.each_line{ |line| @link_string << line }
    create_nodes
  end

  private

  def links
    link_string.gsub(/\n/,', ').split(', ')
  end

  def create_nodes
    links.each do |link|
      nodes<<Node.new(link[0])
      nodes.last.connections[link[1]] = link[2].to_i
    end
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

