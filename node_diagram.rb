
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
    unq_nodes.each { |node| nodes << Node.new(node)}
    create_node_connections
  end

  def create_node_connections
    links.each do |link|
      node=find_node(link[0])
      node.connections[link[1]] = link[2].to_i
    end
  end

  def uniq_nodes
    nodes = []
    links.each{ |link| nodes << link[0] }
    nodes.uniq
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

