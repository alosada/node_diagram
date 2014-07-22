require './node_diagram'

describe Diagram do
  diagram = Diagram.new('links.md')
  describe "#link_string" do
    it "Returns the original links it recieved as input" do
      expect(diagram.link_string.is_a?(String)).to be true
    end
  end
end
