require './lib/order.rb'

describe Order do

  subject(:order) { described_class.new }

  context "Provided a menu" do

    describe "#display_menu" do
      it "shows the menu" do
        expect(order.display_menu).to eq nil
      end
    end

  end

  context "Provided an order" do

    describe "#generate_order" do
      it "generates an order with the desired dishes from our menu" do
        expect(order.generate_order).not_to be_empty
      end
    end

    describe "#compose_order" do
      it "composes a string out of a list of selected items with name & price" do
        moke_dish = double(:dish, name: "fabada", price: 3)
        list = [moke_dish]
        expect(order.compose_order(list)).to match "You ordered:\nOne dish of fabada\nWe hope you like it"
      end
    end

    describe "#display" do
      it "displays an order" do
        expect(order.display).to eq nil
      end
    end

  end

end
