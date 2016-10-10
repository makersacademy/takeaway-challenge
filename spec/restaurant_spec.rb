require 'menu'
require 'restaurant'

describe Restaurant do
  subject(:restaurant) {
    dishes = [['Tiramisu', '4.50'], ['Gelato', '3.50']]
    allow(CSV).to receive(:read).with('dishes.csv') { dishes }
    described_class.new(Menu.new('dishes.csv'))
  }

  describe '#add_to_order' do
    it 'adds dishes to current order' do
      # TODO: how do I test one without the other?
      restaurant.add_to_order('Tiramisu')
      restaurant.add_to_order('Gelato')
      expect(restaurant.order_items).to include 'Tiramisu', 'Gelato'
    end
  end

  describe '#order_total' do
    it 'returns total prize of the meal' do
      restaurant.add_to_order('Tiramisu')
      restaurant.add_to_order('Gelato')
      expect(restaurant.order_total).to eq 8.0
    end
  end
end
