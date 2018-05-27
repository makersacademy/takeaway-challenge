require 'order'

describe Order do

  let(:menu_double) { double :menu }
  let(:dish_choice) { double :dish }
  let(:wrong_dish_choice) { double :wrong_dish }
  let(:order_quantity) {double :order_quantity }

  subject(:order) { described_class.new(menu_double) } # to be doubled in due course

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  describe "#select" do

    it "allows user to select dishes from the menu" do
      allow(menu_double).to receive(:choices).and_return({dish_choice => nil})
      order.select_dish(dish_choice, order_quantity)
      expect(order.basket[dish_choice]).to eq order_quantity
    end

    it "raises error if dish is not on the menu" do
      allow(menu_double).to receive(:choices).and_return(Hash.new)
      message = "Order could not be taken: not on the menu"
      expect { order.select_dish(wrong_dish_choice, order_quantity) }.to raise_error message

    end

  end

end
