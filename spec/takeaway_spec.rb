require 'takeaway'

describe Takeaway do

  describe "#menu do" do
    it "shows a list of dishes with prices" do
      expect(subject.menu).to eq @menu
    end
  end
end
