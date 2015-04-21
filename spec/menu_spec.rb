require 'menu'

describe Menu do
  let(:dishes) do
    {
      cheeseburger: 3.00,
      hamburger: 2.00,
      chips: 1.50,
      coke: 1.00,
      water: 0.80
    }
  end

  let(:menu) { described_class.new }
  let(:some_dishes) { { cheeseburger: 2, chips: 1, coke: 1 } }
  let(:my_order) { { cheeseburger: 2, chips: 1, coke: 1, total: 8.50 } }

  it 'presents a list of dishes with prices' do
    expect(menu.show_menu).to eq dishes
  end

  it 'returns the price of any menu item' do
    dishes.each do |dish, price|
      menu.select_dishes(dish)
      expect(menu.price).to eq price
    end
  end

  it 'can allow multiple menu items to be selected' do
    menu.select_dishes(some_dishes)
    expect(menu.selection).to eq some_dishes
  end

  it 'raises an error if nothing is selected' do
    expect { menu.select_dishes({}) }.to raise_error 'Please select an item'
  end

  it 'calculates the price of the selection' do
    menu.select_dishes(some_dishes)
    expect(menu.price).to eq 8.50
  end

  it 'returns the correct order' do
    menu.select_dishes(some_dishes)
    expect(menu.order).to eq my_order
  end
end