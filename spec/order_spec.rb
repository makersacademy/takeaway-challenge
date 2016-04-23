require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'stores selected food items and their total count' do
    list = { hamburger: 1, pizza_deluxe: 2 }
    order.add(:hamburger, 1)
    order.add(:pizza_deluxe, 2)
    expect(order.list).to eq list
  end
end
