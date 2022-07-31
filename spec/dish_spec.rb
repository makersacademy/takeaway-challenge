require './lib/dish'

describe Dish do
  subject { Dish.new('Beef burger', 12) }

  it 'dish has a name' do
    expect(subject.name).to eq('Beef burger')
  end

  it 'dish has a price' do
    expect(subject.price).to eq(12)
  end
end