require './node_diagram'
require 'rspec'

RSpec.describe NodeDiagram do
  diagram = NodeDiagram.new('links.md')
  describe "#find_paths" do
    it "Returns all paths betweet A & C" do
      expect(diagram.find_paths('A','C')).to eq(["ABC", "ABEDC", "ABEC", "ADC", "ADEC", "ADEBC", "AEDC", "AEC", "AEBC"])
    end
  end
  describe "#path_value" do
    it "Returns the value of path A-B-C (9)" do
      expect(diagram.path_value(['A','B','C'])).to eq(9)
    end
  end
  describe "#min_path" do
    it "Returns the minimun value and the path betweet A & C  ({path:['ABC'], value: 9})" do
      expect(diagram.min_path('A','C')).to eq({path:'ABC', value: 9})
    end
  end
  describe "#max_path" do
    it "Returns the minimun value and the path betweet A & C ({path:['ABEDC'], value: 22})" do
      expect(diagram.max_path('A','C')).to eq({path:'ABEDC', value: 22})
    end
  end
end

describe NodeDiagram::Node do
  node=NodeDiagram::Node.new('Z')
  node.resolve_link(['Z','Y','1'])
  node.resolve_link(['Z','X','2'])
  describe "#links" do
    it "Returns the correct links" do
      expect(node.links).to eq({'Y'=>1, 'X'=>2})
    end
  end
end
