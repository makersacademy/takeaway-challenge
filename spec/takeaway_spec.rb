require './lib/takeaway.rb'

describe Takeaway do

subject(:takeaway){described_class.new(order_klass, sms_klass)}
let(:order_klass){double :order_klass, :new => placed_order}
let(:sms_klass){double :sms_klass, :new => text, :send_message => ""}
let(:text){double :text}
let(:placed_order){double :placed_order, :selected_dishes => [],
  :view_order => {}, :total_cost => "", :confirm_order => {}}
let(:SMS) {double :SMS}

  context "The available dishes" do
    it "should have a list of all dishes and their prices" do
      expect(takeaway.view_menu).to eq Takeaway::ALL_DISHES
    end
  end

  context "Storing selected dishes from the customer" do
    it "should allow customer to select dishes and quantity" do
      expect(takeaway).to respond_to(:select).with(2).arguments
    end

    it "should add dishes to Order if a dish has already been selected" do
      takeaway.select(1, 2)
      takeaway.select(2, 1)
      expect(placed_order.selected_dishes).to eq([{"Chicken Adobo"=>4.5}, {"Chicken Adobo"=>4.5}, {"Pancit Bihon"=> 4.5}])
    end

    it "should add to order when customer selects a dish after generating new order" do
      takeaway.select(1, 2)
      expect(placed_order.selected_dishes).to eq([{"Chicken Adobo"=>4.5}, {"Chicken Adobo"=>4.5}])
    end

    it "should raise error if dish is not available" do
      expect{takeaway.select("Something", 1)}.to raise_error("Sorry, please pick an available dish option (1-8)")
    end
  end

  context "Checking order" do
    it "should raise error if no order has been made" do
      expect{takeaway.check_order}.to raise_error("No order has been made.")
    end

    it "shoud list out dishes, quantity and total cost" do
      takeaway.select(1, 2)
      allow(placed_order).to receive(:view_order) {{"Chicken Adobo"=>2, "Total cost"=>"£9.0"}}
      expect(takeaway.check_order).to eq placed_order.view_order
    end
  end

  context "checking cost of order" do
    it "should raise error if no order has been made" do
      expect{takeaway.total_cost}.to raise_error("No order has been made.")
    end

    it "should return the total cost of everything ordered" do
      takeaway.select(1, 2)
      allow(placed_order).to receive(:total_cost) {"£13.5"}
      expect(takeaway.total_cost).to eq placed_order.total_cost
    end
  end

  context "Confirming order" do
    it "should raise error if no order has been made" do
      expect{takeaway.confirm_order}.to raise_error("No order has been made.")
    end

    it "should confirm message is sent" do
      takeaway.select(1,2)
      message = "Thank you for your order"
      allow(sms_klass).to receive(:send_message) {message}
      expect(takeaway.confirm_order).to eq("Thank you for your order")
    end
  end

end
