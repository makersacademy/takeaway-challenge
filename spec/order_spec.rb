require 'order.rb'
require 'menu.rb'

describe Order do
    subject(:order) { described_class.new(menu) }

    let(:menu) { double(:menu) }

    let(:dishes) { {chips: 2, burger: 2} }

    before do
        allow(menu).to receive(:price).with(:burger).and_return(7)
        allow(menu).to receive(:price).with(:chips).and_return(3)
    end

    it "selects multiple dishes from the menu" do
        order.add(:chips, 2)
        order.add(:burger, 2)
        expect(order.selection).to eq(dishes)
    end

    it "calculates the total for the order" do
        order.add(:chips, 2)
        order.add(:burger, 2)
        total = 20
        expect(order.total).to eq(total)
      end


end