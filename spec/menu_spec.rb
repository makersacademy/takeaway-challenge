# frozen_string_literal: true

require './lib/menu.rb'
describe Menu do
  let(:menu) { Menu.new(items) }
  let(:items) { { 'Burger' => 5, 'Chips' => 3 } }

  let(:printed_format) { "Burger: £5 \nChips: £3 \n" }

  it 'returns the menu in printable format' do
    expect(menu.print_items).to eq(printed_format)
  end

  it 'knows when an item is available on the menu' do
    expect(menu.item_unavailable?('Burger')).to be false
  end

  it 'knows when an item is not on the menu' do
    expect(menu.item_unavailable?('Fish')).to be true
  end

  it 'returns items correct price' do
    expect(menu.get_price('Burger')).to eq 5
  end
end
