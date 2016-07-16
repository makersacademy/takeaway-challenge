require 'takeaway'

describe Takeaway do

  describe "#menu_array" do
    it "is an array" do
      expect(subject.menu_array).to be_an_instance_of(Array)
    end
  end
end
