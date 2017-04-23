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

end
