
class Diagram

  attr_accessor :link_string, :nodes

  def initialize(path)
    @link_string = ''
    @nodes = []
    link_string = File.open(path, 'r')
    link_string.each_line{ |line| @link_string << line }
    create_nodes
  end
  #AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7
  def find_paths(start, finish, repeat=false)
    @paths = []
    build_paths(start, finish) unless repeat
    @paths
  end

  private

  def build_paths(start, finish, this_path=[])
    this_path << start
    if this_path.last == finish #&& this_path.length > 1
      @paths << Array.new(this_path)
      this_path
    else
      find_node(start).links.keys.each do |link|
        this_path = build_paths(link, finish, this_path) unless this_path.include?(link)
      end
    end
    this_path.pop
    this_path
  end

  def links
    link_string.gsub(/\n/,', ').split(', ')
  end

  def create_nodes
    uniq_nodes.each { |node| nodes << Node.new(node)}
    create_node_links
  end

  def create_node_links
    links.each do |link|
      node=find_node(link[0])
      node.links[link[1]] = link[2].to_i
    end
  end

  def uniq_nodes
    nodes = []
    links.each{ |link| nodes << link[0] }
    nodes.uniq
  end

  def find_node(label)
    nodes.each{|node| return node if node.label == label}
    false
  end

end

class Node

  attr_accessor :label, :links

  def initialize(label)
    @label=label
    @links = {}
  end

  def to_s
    label
  end

end

dia=Diagram.new('links.md')
p dia.find_paths('A', 'C')

