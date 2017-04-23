require 'menu'

describe Menu do

  subject(:menu) { described_class.new(menu_items) }

  let(:menu_items) do
    {
      pizza: 5.00,
      nachos: 3.50
    }
  end

  it 'has menu with content' do
    expect(menu.menu_items).not_to be_empty
  end

  it 'has a list of food items and prices' do
    expect(menu.menu_items).to eq(menu_items)
  end

  it 'prints a list of food items with prices' do
    food_list = "Pizza £5.00, Nachos £3.50"
    expect(menu.print_menu).to eq(food_list)
  end

  it 'allows process to proceed if an item is on the menu' do
    expect(menu.in_menu?(:pizza)).to be true
  end

  it 'raises error if an item is not on the menu' do
    expect(menu.in_menu?(:lasagne)).to be false
  end

  it 'calculates a price' do
    expect(menu.price(:burger)).to eq(menu_items[:burger])
  end
  
end
