require 'dish'

describe Dish do
  let(:subject) { Dish.new(:burger, 5) }

  it 'can have a name' do
    expect(subject.name).to be(:burger)
  end

  it 'can have a price' do
    expect(subject.price).to be(5)
  end
end