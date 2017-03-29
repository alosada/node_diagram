
class Diagram

  attr_accessor :link_string, :nodes

  def initialize(path)
    @link_string = ''
    @nodes = []
    link_string = File.open(path, 'r')
    link_string.each_line{ |line| @link_string << line }
    create_nodes
  end

  def find_paths(start, finish)
    @paths = []
    build_paths(start, finish)
    @paths
  end

  def path_value(path)
    i = 0
    distance = 0
    while i + 1 < path.length
      distance = resolve_distance(distance, i)
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

  def resolve_distance(distance, i)
    distance_next = find_node(path[i]).links.fetch(path[i+1], false)
    return "NO SUCH ROUTE" unless distance_next
    distance + distance_next
  end

  def min_max_path(start, finish, min)
    paths = find_paths(start, finish)
    path_values=paths.map { |path| path_value(path) }
    value = path_values.min if min
    value = path_values.max if !min
    {path: paths[path_values.index(value)], value: value}

  end

  def build_paths(start, finish, this_path=[])
    this_path << start
    if this_path.last == finish && this_path.length > 1
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
    uniq_nodes.each { |node| nodes << Node.new(node, {})}
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

Node = Struct.new(:label, :links)

node = Node.new('foo', {})
p node.to_s
p node.links
# dia = Diagram.new('links.md')
# p dia.min_path('A', 'C')
# p dia.max_path('A', 'C')

