require_relative '../lib/menu.rb'
describe Menu do

  let(:dishes) do {
    Tofu: 2.50,
    Falafel: 3.50,
    Spaghetti: 2.99,
  }
  end

  subject(:menu) { described_class.new(dishes)}

  it 'has a list of avaible dishes' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'shows menu list' do
    dishes_list = 'Tofu £2.50, Falafel £3.50, Spaghetti £2.99'
    expect(menu.show).to eq(dishes_list)
  end

  it 'checks if the dish is in menu' do
    expect(menu.include_dish?(:Tofu)).to be true
  end

end