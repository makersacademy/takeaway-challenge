# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'take_away'
describe TakeAway do
    let(:items){ {chicken: 6, pizza: 10, chips: 4} }
    let(:menu){ Menu.new(items) }
    let(:order){ Order.new(menu)}
    let(:subject){TakeAway.new(order, menu)}
    let(:item) { {chicken: 2} }

    describe "#show_dishes" do
      it "prints the menu" do
        
      end
    end

    describe "#order" do
      it "allows placing an order" do
        allow(order).to receive(:add).with(:chicken, 2)
        expect(subject.order).to eq item
      end
    end
end