require 'takeaway'

describe Takeaway do

  describe "read_menu" do
    it "should load menu" do
      expect(subject.read_menu).to include("Tofish Bites": 6)
    end
  end
end
