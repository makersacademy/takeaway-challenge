require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:pizza_price) { 15 }
  let(:menu) { {pizza_deluxe: pizza_price} }

  it 'stores selected food items and their total count' do
    list = { hamburger: 1, pizza_deluxe: 2 }
    order.add(:hamburger, 1)
    order.add(:pizza_deluxe, 2)
    expect(order.list).to eq list
  end

  it 'adds total price to finished order' do
    order.store_cost('sum')
    expect(order.list).to include(:total_price)
  end


  describe '#calculate_total(menu)' do
    it 'returns the current total amount of the order' do
      order.add(:pizza_deluxe, 2)
      expect(order.calculate_total(menu)).to eq 2*pizza_price
    end
  end
end
