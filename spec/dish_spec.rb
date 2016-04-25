require 'dish'

describe Dish do
  subject(:dish) { described_class.new(name: "Pizza", price: 7.99) }

  it 'sets quantity to nil when dish is created' do
    expect(dish.quantity).to eq nil
  end
end