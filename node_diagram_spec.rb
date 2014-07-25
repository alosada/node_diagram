require './node_diagram'

describe Diagram do
  diagram = Diagram.new('links.md')
  describe "#link_string" do
    it "Returns the original links it recieved as input" do
      expect(diagram.link_string.is_a?(String)).to be true
    end
  end
end

describe Node do
  node=Node.new('Z')
  node.connections = {'Y'=>1, 'X'=>2}
  describe "#connections" do
    it "Returns the connection labels" do
      expect(node.connections.keys).to eq(["Y", "X"])
    end
  end
end
