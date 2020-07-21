# frozen_string_literal: true

require 'order'
describe Order do
  let(:menu) { double(:menu) }

  let(:order) { Order.new(menu) }

  it 'adds available item on the menu to basket' do
    allow(menu).to receive(:item_unavailable?) { false }
    order.add_item('Burger', 5)
    expect(order.basket).to eq({ 'Burger' => 5 })
  end

  it 'raises an error if item to be added is not on the menu' do
    allow(menu).to receive(:item_unavailable?) { true }
    expect { order.add_item('Pasta', 5) }.to raise_error('Item not on menu')
  end

  it 'basket total is correct' do
    allow(menu).to receive(:item_unavailable?) { false }
    allow(menu).to receive(:get_price).and_return(10, 5)
    order.add_item('Burger', 5)
    order.add_item('Chips', 5)
    expect(order.basket_total).to eq(75)
  end
end
