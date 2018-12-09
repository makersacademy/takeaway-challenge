require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { { "Hamburger" => 5 } }

  describe '#add_to_basket' do
    it 'adds a dish to the basket' do
      order.add_to_basket("Hamburger")

      expect(order.basket).to include "Hamburger"
    end

    it 'adds some number of the same dish to the basket' do
      order.add_to_basket("Hamburger", 2)

      expect(order.basket).to eq ["Hamburger", "Hamburger"]
    end
  end

  describe '#total' do
    it 'totals the prices of all the dishes in the basket' do
      order.add_to_basket("Hamburger", 3)
  
      expect(order.total).to eq 15
    end
  end
end
