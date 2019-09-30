require 'dish'

describe Dish do
  subject(:dish) { described_class.new(name: 'shwarma', cost: 9) }
  it 'can return correct price' do
    expect(dish.cost).to eq 9
  end

  it 'can return correct name' do
    expect(dish.name).to eq 'shwarma'
  end
end
