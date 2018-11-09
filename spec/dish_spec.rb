require 'dish'

describe Dish do
  subject { Dish.new('Pizza', 3.50) }

  it 'has a name' do
    expect(subject.name).to eq 'Pizza'
  end

  it 'has a price' do
    expect(subject.price).to eq 3.50
  end
end
