require 'menu'

describe Menu do
  subject(:menu) { described_class.new(items) }
  let(:items) do
    {
      Yummy: 2.00,
      Tasty: 3.50
    }
end
  it 'has the menu items with prices' do
    expect(menu.items).to eq(items)
  end

  it 'shows the menu items with prices' do
    printed_menu = "Yummy: £2.00, Tasty: £3.50"
    expect(menu.to_string).to eq(printed_menu)
  end

  it 'checks if item is on the menu' do
    expect(menu.has_item?(:Yummy)).to be true
  end

  it 'checks if item is not on the menu' do
    expect(menu.has_item?(:Yucky)).to be false
  end

  it 'calculates the price' do
    expect(menu.price(:Yummy)).to eq(items[:Yummy])

  end
end
