require 'dish'

describe Dish do
  subject { Dish.new("Food", 5.00) }
  it 'initializes with a price' do
    expect(subject.price).to eq 5.00
  end
  it 'initializes with a name' do
    expect(subject.name).to eq "Food"
  end
end
