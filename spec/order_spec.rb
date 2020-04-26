require 'order'
require 'menu'
require 'bill'

describe Order do
  describe "#add_to_order" do
    it "Should add items to a user's order" do
      expect { subject.add_to_order("Egg Fried Rice", 2) }.to change { subject.order.length }.by(1)
    end

    it "should only add an item if the item is present on the menu" do
      expect { subject.add_to_order("Chips", 1) }.to raise_error("This item is not on the menu")
    end
  end

  describe "Order info" do
    let(:menu) { Menu.new }

    before(:each) do
      menu.order
      menu.my_order.add_to_order("Egg Fried Rice", 2)
      menu.my_order.add_to_order("Sweet and Sour Chicken", 2)
    end

    describe "#current_total" do
      it "calculates total price of current order" do
        expect(menu.my_order.current_total).to eq(16.0)
      end
    end

    describe "#view order" do
      it "Prints out order" do
        expect{ menu.my_order.view_order }.to output(String).to_stdout
      end
    end
  end
end
