require 'rspec'
require 'dish'

describe Dish do
  subject(:dish) { described_class.new("Ratatouille", 10) }

  it 'has a name' do
    expect(dish.name).to eq "Ratatouille"
  end

  it 'has a price' do
    expect(dish.price).to eq 10
  end
end
