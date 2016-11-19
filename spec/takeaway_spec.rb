require './lib/takeaway.rb'

describe Takeaway do

subject(:takeaway){described_class.new(order_klass)}
let(:order_klass){double :order_klass, :new => order}
let(:order){double :order, :selected_dishes => []}

  context "The available dishes" do
    it "should have a list of all dishes and their prices" do
      expect(takeaway.all_dishes).to eq Takeaway::ALL_DISHES
    end

    it "should be able to view menu" do
      expect(takeaway.view_menu).to eq takeaway.all_dishes
    end
  end

  context "Storing selected dishes from the customer" do

    it "should allow customer to select dishes and quantity" do
      expect(takeaway).to respond_to(:select).with(2).arguments
    end

    it "should add to order when customer selects a dish after generating new order" do
      takeaway.generate_new_order
      takeaway.select(1, 2)
      expect(order.selected_dishes).to eq([{"Chicken Adobo"=>4.5}, {"Chicken Adobo"=>4.5}])
    end

    it "should raise error if a new order hasn't been generated" do
      expect{takeaway.select(1, 2)}.to raise_error("You have not generated a new order to add to yet.")
    end
  end

  context "Checking order" do


  end

end
