require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:non_existant_dish) {double :dish}

  describe "#view_menu" do
    it {is_expected.to respond_to(:view_menu)}

    context "so I can see what's on the menu" do
      it "returns menu items" do
        expect_any_instance_of(Menu).to receive(:items)
        takeaway.view_menu
      end
    end
  end

  describe "#add_to_order" do
    it {is_expected.to respond_to(:add_to_order)}
    context "when adding an item" do
      it "adds the item and the amount to the order" do
        expect{takeaway.add_to_order("Fish and Chips", 1)}.to change(takeaway, :order)
      end
      it "if the item doesn't exist" do
        message = "Cannot add to order: that dish is not on the menu"
        expect{takeaway.add_to_order(non_existant_dish, 1)}.to raise_error message
      end
    end
  end
end
