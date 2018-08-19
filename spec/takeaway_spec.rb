require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }


  describe "#view_menu" do
    it "shows a shows a list of dishes with prices" do
      expect(takeaway.view_menu).to eq({ "Pepperoni" => 7.50, "Hawaiian" => 6.50, "vegetarian" => 5.50 })
    end
  end

  describe "#add_to_order" do

    it "can select some number of several available dishes" do
      takeaway.add_to_order("Pepperoni", 2)
      expect(takeaway.order).to eq({ "Pepperoni" => 2 })
    end

    it "will not allow items that are not on the menu to be added" do
      expect { takeaway.add_to_order("Burger", 1) }.to raise_error("Burger is not on the menu")
    end
  end

end
