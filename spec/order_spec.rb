require 'menu'
require 'order'
describe Order do
  subject(:order) { described_class.new }

  describe "#select_dish" do
    it "raises an error if dish not on the menu" do
      expect { order.select_dish("gumbo", 1) }.to raise_error "Dish not available"
    end
  end
  context "The dish is available on the menu" do
    before(:each) do
      order.select_dish('margherita', 1)
    end
    it "adds the selected dish and quantity to ordered_dishes" do
      expect(order.ordered_dishes).to eq(["1 x margherita"])
    end

    it "stores quantity and price" do
      order.select_dish("marinara", 2)
      expect(order.price_total).to eq([[1, 7.00], [2, 6.00]])
    end

    describe "#total_price" do
      it "calculates the total price of the order" do
        order.select_dish("marinara", 2)
        order.select_dish("meatfeast", 1)
        expect(order.total_price).to eq(29.5)
      end
    end

    describe '#compare_price' do
      it "raises an error if user price estimate isn't the same as" do
        order.select_dish("margherita", 1)
        expect { order.compare_price(8) }.to raise_error "Recalculate the total of your order"
      end

      it "outputs a message with the right amount" do
        expect { order.compare_price(7.00) } .to output(/You calculated right, the price is £7.0/).to_stdout
      end
    end
  end
end
