require './node_diagram'

describe Diagram do
  diagram = Diagram.new('links.md')
  describe "#link_string" do
    it "Returns the original links it recieved as input" do
      expect(diagram.link_string.is_a?(String)).to be true
    end
  end
  describe "#find_paths" do
    it "Returns all paths betweet A & C" do
      expect(diagram.find_paths('A','C')).to eq([["A", "B", "C"], ["A", "D", "C"], ["A", "D", "E", "B", "C"], ["A", "E", "B", "C"]])
    end
  end
  describe "#path_value" do
    it "Returns the value of path A-B-C (9)" do
      expect(diagram.path_value(['A','B','C'])).to eq(9)
    end
  end
  describe "#min_path" do
    it "Returns the minimun value and the path betweet A & C ({path:['A','B','C'], value: 9})" do
      expect(diagram.min_path('A','C')).to eq({path:['A','B','C'], value: 9})
    end
  end
  describe "#max_path" do
    it "Returns the minimun value and the path betweet A & C ({path:['A', 'D', 'E', 'B', 'C'], value: 18})" do
      expect(diagram.max_path('A','C')).to eq({path:["A", "D", "E", "B", "C"], value: 18})
    end
  end
end

describe Node do
  node=Node.new('Z')
  node.links = {'Y'=>1, 'X'=>2}
  describe "#links" do
    it "Returns the connection labels" do
      expect(node.links.keys).to eq(["Y", "X"])
    end
  end
end
