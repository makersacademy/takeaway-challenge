require 'cafe'

describe Cafe do
  subject(:cafe) { described_class.new }

  context '#print_menu'
  it 'displays a menu of available items' do
    expect(cafe.print_menu).to eq Cafe::MENU
  end

  context '#add_to_basket'
  it 'pushes the selected items into the basket' do
    expect { cafe.add("Buckwheat Shamalam") }.to change { cafe.basket }.to(["Buckwheat Shamalam, 5.00"])
  end

  context '#total_items'
  it 'calculates the number of items in the basket' do
    expect(cafe.total_items).to eq cafe.basket.count
  end

  context '#total_value'
  it 'calculates the total value of items in the basket' do
    expect(cafe.total_value).to eq cafe.basket.sum
  end
end
