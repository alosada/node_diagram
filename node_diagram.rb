
class NodeDiagram

  attr_accessor :links, :nodes

  def initialize(file_path)
    @nodes = []
    @links = []
    resolve_links(file_path)
  end

  def find_paths(start, finish)
    @paths = []
    build_paths(start, finish)
    @paths
  end

  def path_value(path)
    path = path.split('')
    i = 0
    distance = 0
    while i + 1 < path.length
      distance_next = find_node(path[i]).links.fetch(path[i+1], false)
      raise "No such route" unless distance_next
      distance += distance_next
      i+=1
    end
    distance
  end

  def min_path(start, finish)
    min_max_path(start, finish, true)
  end

  def max_path(start, finish)
    min_max_path(start, finish, false)
  end

  private

  def resolve_links(file_path)
    file = File.open(file_path, 'r')
    file.each_line do |line|
      links << line.gsub!("\n", '')
      link = line.split(', ')
      resolve_nodes(link)
    end
  end

  def resolve_nodes(link)
    link.first(2).each do |label|
      node = resolve_node(label)
      node.resolve_link(link)
    end
  end

  def resolve_node(label)
    node = find_node(label)
    return node unless node.nil?
    nodes << Node.new(label)
    nodes.last
  end

  def min_max_path(start, finish, min)
    build_paths(start, finish)
    path_values = @paths.map { |path| path_value(path) }
    value =
      if min
        path_values.min
      else
        path_values.max
      end
    {path: @paths[path_values.index(value)], value: value}
  end

  def build_paths(start, finish, this_path=[])
    this_path << start
    if this_path.last == finish && this_path.length > 1
      @paths << this_path.join('')
    else
      find_node(start).links.keys.each do |link|
        this_path = build_paths(link, finish, this_path) unless this_path.include?(link)
      end
    end
    this_path.pop
    this_path
  end

  def create_node_links
    links.each do |link|
      node = find_node(link[0])
      node.links[link[1]] = link[2].to_i
    end
  end

  def find_node(label)
    nodes.each{|node| return node if node.label == label}
    nil
  end

  class Node
  
    attr_accessor :label, :links
    
    def initialize(label)
      @label = label
      @links = Hash.new
    end

    def resolve_link(path)
      return nil unless path.include? label 
      link = Array.new(path)
      link.delete(label)
      links[link.first] = link.last.to_i unless links.fetch(link.first, false)
    end
  
  end
end
