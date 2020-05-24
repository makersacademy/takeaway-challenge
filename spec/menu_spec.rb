require_relative '../lib/menu'

describe Menu do

  subject(:menu) { Menu.new(dishes) }
  let(:dishes) { { pizza: 5.00, kebab: 4.00 } }
  
  it 'should have a list of dishes and their prices' do
    expect(menu.dishes).to eq(dishes)
  end 

  it 'should check if a dish is available' do
    menu = Menu.new({ pizza: 5.00, kebab: 4.00 })
    expect(menu.dish_available?(:pizza)).to be true
  end

  it 'should return false if a dish is not available' do
    expect(menu.dish_available?(:burger)).to be false
  end

  it 'should show the price for a dish' do
    expect(menu.price(:pizza)).to eq 5
  end

end
