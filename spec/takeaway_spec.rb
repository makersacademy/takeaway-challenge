require "takeaway"

describe Takeaway do

  let(:takeaway) { described_class.new }

  describe "#dishes with prices" do

    it "checks that the takeaway menu exists" do
      expect(takeaway).to respond_to(:menu)
    end

    it "checks that the menu contains a tasty choice" do
      expect(takeaway.menu).to include "Chicken Balti"
    end

    it "finds a value of a menu item" do
      expect(takeaway.menu["Saag Aloo"]).to eq 3
    end

  end

end
