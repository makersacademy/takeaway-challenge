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

  end

end
