require "takeaway"

describe Takeaway do

  let(:takeaway) { described_class.new }

  context "#initialize" do
    it "initializes with a menu object" do
      expect(takeaway.menu).to be_an_instance_of Menu
    end
  end
end
