require './lib/user'
require "./lib/menu"
require "./lib/order"

describe User do
  let(:menu) { Menu.new }
  let(:unicorn) { Order.new }
  let(:item) { "order" }
  let(:quantity) { double :user }

  describe "#Call menu items" do 
    it "Returns the full menu" do
      expect(subject.request_full_menu(menu)).to eq(menu.full_menu)
    end
  end

  describe "#new_order" do 
    it "Returns a new Order class to instance varible" do
      subject.new_order
      expect((subject.order).class).to eq(Order)
    end 
  end 

  describe "#add_to_order" do
    it "Interacts with Order class adding item and quantity to hash of arrays" do
      subject.new_order
      subject.add_to_order(item, quantity)
      expect(subject.order.current_items).to eq(:order => [quantity])
    end 
  end 
end 