require 'order.rb'

describe Order do
    subject(:order) { described_class.new }

    let(:dishes) { {chips: 2, burger: 3} }

    it "selects multiple dishes from the menu" do
        order.add(:chips, 2)
        order.add(:burger, 3)
        expect(order.dishes).to eq(dishes)
    end
end