require 'menu'

describe Menu do
  let(:dishes) do
    {
      bigmac: 3.99,
      quater_pounder: 3.99,
      chicken_mcnuggets: 2.50,
      fries: 0.99,
      cheese_burger: 0.99,
      ham_burger: 0.99,
      milk_shake: 0.99
    }
  end
  let(:menu) { Menu.new }
   let(:some_dishes) { { bigmac: 3, fries: 1, milk_shake: 2 } }

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
    expect{menu.select_dishes({})}.to raise_error 'Please Select at least one item'
  end

  it 'calculates the price of the selection' do
    menu.select_dishes(some_dishes)
    expect(menu.price).to eq 14.940000000000001
  end


end
# will want to bundle the output from menu into one standard output
# type and NOT call it's various methods from outside the class