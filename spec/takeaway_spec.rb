require "takeaway"
describe Takeaway do

  # Doubles
  # Menu (the class)
  # Instace of menu class
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu)       { double :menu_instance         }

  # Order (the class)
  # Instance of order
  let(:order_class) { double :order_class, new: order }
  let(:order)       { double :order_instance          }
    
  subject(:takeaway) { described_class.new(menu_class, order_class) }

  describe "#initialize" do
    it "creates a new menu object" do
      expect(menu).to receive(:new) 
      menu.new
    end

    it "creates a new order object" do
      expect(order).to receive(:new) 
      order.new
    end
  end

  describe "#print_menu" do
    it "delegates to menu object" do
      expect(menu).to receive(:print)
      takeaway.print_menu
    end 
  end 

  describe "#add_to_order" do
    it "delegates to order object with arguments" do
      dish = "meat"
      quantity = 1
      expect(order).to receive(:add).with(dish, quantity)
      takeaway.add_to_order(dish, quantity)
    end
  end

  describe "#order_total" do
    it "delegates calculation of order total to order object" do
      expect(order).to receive(:total)
      takeaway.order_total 
    end
  end

  describe "#confirm" do
    it "delegates order confirmation order object" do
      expect(order).to receive(:confirm)
      takeaway.confirm
    end
  end 
end
