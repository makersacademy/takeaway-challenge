require "dish.rb"

describe Dish do
  
  let(:name) { double(:name) }
  let(:price) { double(:price) }
  subject { Dish.new(name, price) }

  it 'initializes a name with the argument given' do
    expect(subject.name).to eql(name)
  end
  it 'initializes a price with the argument given' do
    expect(subject.price).to eql(price)
  end
  it 'is initialized with available as true by default' do
    expect(subject.available).to be true
  end
end
