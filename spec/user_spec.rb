require './lib/user'
require "./lib/menu"
require "./lib/order"

describe User do
  let(:unicorn) { Order.new }
  let(:item) { "order" }
  let(:quantity) { double :user }

  describe "#Call menu items" do 
    it "Returns the full menu" do
      expect(subject.request_full_menu).to eq(subject.menu.full_menu)
    end
  end

  describe "#new_order" do 
    it "Returns a new Order class to instance varible" do
      subject.new_order
      expect((subject.order).class).to eq(Order)
    end 
  end 

  describe "#add_to_order" do

    it "configures item to downcase" do
      subject.new_order
      subject.add_to_order("Tofu curry", 1)
      expect(subject.order.current_items).to eq("tofu curry" => 1)
    end 

    it "Interacts with Order class adding item and quantity to hash of arrays" do
      subject.new_order
      subject.add_to_order(item, quantity)
      expect(subject.order.current_items).to eq("order" => quantity)
    end 
  end  
end 