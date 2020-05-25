require_relative '../lib/menu'

describe Menu do

  subject(:menu) { Menu.new }
  let(:dishes) do {
      :pizza => 5.00,
      :kebab => 4.00,
      :burger => 3.50,
      :hotdog => 4.50,
      :chips => 2.00
    }
  end
  
  it 'should have a list of dishes and their prices' do
    expect(menu.dishes).to eq(dishes)
  end 

  it 'should check if a dish is available' do
    expect(menu.dish_available?(:pizza)).to be true
  end

  it 'should return false if a dish is not available' do
    expect(menu.dish_available?(:falafel)).to be false
  end

  it 'should show the price for a dish' do
    expect(menu.price(:pizza)).to eq 5
  end

  it 'should print the menu' do
    expect { menu.print_menu }.to output("Pizza: £5.00\nKebab: £4.00\nBurger: £3.50\nHotdog: £4.50\nChips: £2.00\n").to_stdout
  end

end
