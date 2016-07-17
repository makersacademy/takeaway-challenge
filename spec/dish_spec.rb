require 'dish'

describe Dish do

  subject { described_class.new(name: "Caesar Salad", price: 3) }

  it 'has a name' do
    expect(subject.name).to eq "Caesar Salad"
  end

  it 'has a price' do
    expect(subject.price).to eq 3
  end

end
