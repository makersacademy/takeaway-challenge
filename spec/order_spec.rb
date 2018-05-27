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

  describe "#select_dish" do

    it "allows user to select dishes from the menu" do
      allow(menu_double).to receive(:choices).and_return({dish_choice => 1})
      order_quantity = 5
      order.select_dish(dish_choice, order_quantity)
      expect(order.basket[dish_choice]).to eq order_quantity
      #don't like magic number here, not sure how to solve it
    end

    it "raises error if dish is not on the menu" do
      allow(menu_double).to receive(:choices).and_return(Hash.new)
      message = "Order could not be taken: not on the menu"
      allow(order).to receive(:increment_total_order_number).with(1).and_return(nil) #I don't like this line
      expect { order.select_dish(wrong_dish_choice, order_quantity) }.to raise_error message

    end

  end

  describe "#total" do

    it "returns total of orders" do
      allow(menu_double).to receive(:choices).and_return({dish_choice => 1})
      order_quantity = 5
      order.select_dish(dish_choice, order_quantity)
      expect(order.total).to eq order_quantity
      # I don't feel this test is well written, magic number again
    end

  end

  describe "#confirmation" do
    it "sends confirmation text" do
      allow(menu_double).to receive(:choices).and_return({dish_choice => 1})
      allow(order).to receive(:increment_total_order_number).and_return(nil)
      order.select_dish(dish_choice, order_quantity)
      expect(STDOUT).to receive(:puts)
      order.place_order
    end
  end

end
