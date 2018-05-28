require 'order'

describe Order do

  let(:menu_double) { double :menu }
  let(:confirmation_double) { double :confirmation }
  let(:dish_choice) { double :dish }
  order_quantity = 1 # I don't like this magic number

  subject(:order) { described_class.new(menu_double) }

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  describe "#select_dish" do

    context "when dish is on the menu" do

      before do
        allow(menu_double).to receive(:choices).and_return({ dish_choice => 1 })
      end

      it "allows user to select dish" do
        order.select_dish(dish_choice, order_quantity)
        expect(order.basket[dish_choice]).to eq order_quantity
      end

      it "records total of orders" do
        order.select_dish(dish_choice, order_quantity)
        expect(order.total).to eq order_quantity
      end

    end

    context "when dish is not on the menu" do
      
      it "raises error" do
        allow(menu_double).to receive(:choices).and_return(Hash.new)
        message = "Order could not be taken: not on the menu"
        expect { order.select_dish(dish_choice) }.to raise_error message
      end

    end

  end

  describe "#place_order" do
    it "sends confirmation" do
      expect(confirmation_double).to receive(:send)
      order.place_order(confirmation_double)
    end
  end

end
