require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:non_existant_dish) {double :dish}
  let(:dish1) {double :dish, price: 8.99}
  let(:dish2) {double :dish, price: 6.99}

  describe "#view_menu" do
    it {is_expected.to respond_to(:view_menu)}

    context "so I can see what's on the menu" do
      it "returns menu items" do
        expect_any_instance_of(Menu).to receive(:print)
        takeaway.view_menu
      end
    end
  end

  describe "#price" do
    it "gives the price of the item" do

    end

  end

  describe "#add_to_order" do
    context "So I can order dishes" do
      before do
        allow(takeaway).to receive(:exist?).and_return(true)
        takeaway.add_to_order(dish1, 2)
        takeaway.add_to_order(dish2, 1)
      end
      it "allows me to select dishes and amount" do
        expect(takeaway.order).to eq ({dish1 => 2, dish2 => 1})
      end
      it "allows me to view what I've ordered" do
            # expect_any_instance_of(Menu).to receive(:price)
            # takeaway.add_to_order(dish1, 2)
      end
      it "raises an error when I try to add a dish that doesn't exist" do
        allow(takeaway).to receive(:exist?).and_return(false)
        message = "Cannot add to order: dish doesn't exist"
        expect{takeaway.add_to_order(:non_existant_dish)}.to raise_error message
      end
    end
  end
end
