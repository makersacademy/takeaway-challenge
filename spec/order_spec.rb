require "order"
describe Order do

  # Doubles
  # Menu (the class)
  # Instace of menu class
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu)       { double :menu_instance         }

  subject(:order) { Order.new(menu_class) }

  describe "#initialize" do
    it "initializes with an empty order summary array" do
      expect(order.summary).to be_empty
    end

    it "initializes total equal to zero" do
      expect(order.total).to eq 0
    end

    it "initializes a menu object" do
      expect(menu).to receive(:new)
      menu.new
    end

  end
  
  describe "#add" do
    it "adds a dish and quantity to the order summary" do
      order.add("fire", 15)
      expect(order.summary).to include({ name: "fire", quantity: 15 })
    end
  end

  describe "#clac_total" do
    it "requires menu object to complete calculation" do
      expect(menu).to receive(:menu)
      menu.menu
    end
  end  
end
