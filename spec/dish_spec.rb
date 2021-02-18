require 'dish'

describe Dish do
  subject(:pizza) { described_class.new(:pizza, 10, false) }
  subject(:burger) { described_class.new(:burger, 12) }
  
  it 'stores the name of the dish' do
    expect(pizza.name).to eq(:pizza)
  end

  it 'stores the price of the dish' do
    expect(pizza.price).to eq(10)
  end

  it 'stores the availability of the dish' do
    expect(pizza.available).to eq false
  end

  it 'dish is available by default' do
    expect(burger.available).to eq true
  end
end
