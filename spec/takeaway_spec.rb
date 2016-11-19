require './lib/takeaway.rb'

describe Takeaway do

subject(:takeaway){described_class.new(order_klass)}
let(:order_klass){double :order_klass, :new => placed_order}
let(:placed_order){double :placed_order, :selected_dishes => [],
  :view_order => {}, :total_cost => ""}

  context "The available dishes" do
    it "should have a list of all dishes and their prices" do
      expect(takeaway.all_dishes).to eq Takeaway::ALL_DISHES
    end

    it "should be able to view menu" do
      expect(takeaway.view_menu).to eq takeaway.all_dishes
    end
  end

  context "Placing a new order" do
    it "should generate a new order" do
      expect(takeaway.place_new_order).to eq placed_order
    end
  end

  context "Storing selected dishes from the customer" do
    it "should allow customer to select dishes and quantity" do
      expect(takeaway).to respond_to(:select).with(2).arguments
    end

    it "should add to order when customer selects a dish after generating new order" do
      takeaway.place_new_order
      takeaway.select(1, 2)
      expect(placed_order.selected_dishes).to eq([{"Chicken Adobo"=>4.5}, {"Chicken Adobo"=>4.5}])
    end

    it "should raise error if a new order hasn't been generated" do
      expect{takeaway.select(1, 2)}.to raise_error("You have not generated a new order to add to yet.")
    end

    it "should raise error if dish is not available" do
      takeaway.place_new_order
      expect{takeaway.select("Something", 1)}.to raise_error("Sorry, please pick an available dish option (1-8)")
    end
  end

  context "Checking order" do
    it "should be able to view all selected dishes" do
      takeaway.place_new_order
      expect(takeaway.check_order).to eq({})
    end

    it "should raise error if no order has been made" do
      expect{takeaway.check_order}.to raise_error("No order has been made.")
    end

    it "should return the total cost of everything ordered" do
      takeaway.place_new_order
      allow(placed_order).to receive(:total_cost) {"£13.5"}
      expect(takeaway.total_cost).to eq placed_order.total_cost
    end
  end

end
