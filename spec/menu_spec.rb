require './lib/menu.rb'

describe Menu do
  subject(:menu) { described_class.new(dishes_prices) }
  let(:dishes_prices) { { pizza: 10.99, sandwich: 2.99 } }

  it 'list of dishes and prices' do
    expect(menu.dishes_prices).to eq(dishes_prices)
  end

  it 'respond to the includes_dish? method' do
    expect(menu).to respond_to(:includes_dish?).with(1).argument
  end

  it 'checks if an item is on the menu' do
    expect(menu.includes_dish?(:pizza)).to be true
  end

  it 'checks if an item is on the menu' do
    expect(menu.includes_dish?(:beef)).to be false
  end

  it 'calculates prices' do
    expect(menu.get_price(:pizza)).to eq(dishes_prices[:pizza])
  end

end
