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

  it 'clear the basket' do
    subject.add(item)
    subject.clear
    expect(subject.basket).to be_empty
  end

  it 'return true if basket is empty' do
    expect(subject.empty?).to eq true
  end

  it 'return false if basket is empty' do
    subject.add(item)
    expect(subject.empty?).to eq false
  end
end
