require 'dish'

describe Dish do
  subject(:dish) { described_class.new('Food', 299) }

  it 'should return details of name' do
    expect(dish.name).to eq('Food')
  end

  it 'should return details of price' do
    expect(dish.price).to eq(299)
  end
end
