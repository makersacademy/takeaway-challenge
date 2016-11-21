require 'menu'

describe Menu do
subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      hawaiian: 9.99,
      margherita: 7.99,
      vegetarian: 8.99

    }
  end
  it 'should show a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'should print a list of dishes and prices' do
    printed_menu = "Hawaiian £9.99, Margherita £7.99, Vegetarian £8.99"
    expect(menu.print_menu).to eq(printed_menu)
  end

  it 'should be able to check dishes are on menu' do
    expect(menu.has_dish?(:hawaiian)).to eq true
  end

  it 'should be able to check dishes not on the menu' do
    expect(menu.has_dish?(:burger)).to eq false
  end

  it ' should work out the price of items' do
    expect(menu.price(:hawaiian)).to eq(dishes[:hawaiian])
  end
end
