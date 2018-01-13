require './lib/menu.rb'

describe Menu do
  subject(:menu) { described_class.new(dishes_prices) }
  let(:dishes_prices) { { pizza: 10.99, sandwich: 2.99 } }

  it 'list of dishes and prices' do
    expect(menu.dishes_prices).to eq(dishes_prices)
  end
end
