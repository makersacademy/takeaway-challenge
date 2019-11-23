require 'takeaway'

describe Takeaway do

  let(:menu) { double(:menu, show: nil) }

  subject(:takeaway) { Takeaway.new(menu) }

  # I don't think this test does anything
  describe "#show_menu" do
    it "should show the menu" do
      expect { menu.show }.to_not raise_error
    end
  end

end
