require 'basket'

describe Basket do
  let(:item) { double(:item) }

  it 'is an empty array at creation' do
    expect(subject.basket).to be_empty
  end

  it 'adds an item to the basket' do
    subject.add(item)
    expect(subject.basket).to include(item)
  end
end