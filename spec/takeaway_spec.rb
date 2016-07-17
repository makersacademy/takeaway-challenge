require 'takeaway'

describe Takeaway do
  describe "#print_menu" do
    it "prints out a list of menu items and their prices" do
      expect(subject.print_menu).to eq "balti £5.0 , vindaloo £4.5"
    end
  end
end
