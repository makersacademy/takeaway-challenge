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

  describe "#order" do

    it "should add an item to the basket" do
      takeaway.order("McChicken")
      expect(takeaway.basket).to include "McChicken"
    end

    it "should add multiple items to the basket" do
      takeaway.order("McChicken", 4)
      expect(takeaway.basket["McChicken"]).to eq 4
    end

  end

end
