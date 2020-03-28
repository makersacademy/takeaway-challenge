require 'dish'

describe Dish do
  it 'initializes with name "Dish"' do
    expect(subject.name).to eq "Dish"
  end
  it 'initializes with price 0' do
    expect(subject.price).to eq 0
  end
end
