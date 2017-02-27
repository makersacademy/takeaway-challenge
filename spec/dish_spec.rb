require 'dish'

describe Dish do

  subject(:dish) { described_class.new("Jollof Rice", 5.99) }

  it 'has a name' do
    expect(dish.name).to eql "Jollof Rice"
  end

  it 'has a price' do
    expect(dish.price).to eql 5.99
  end

end
