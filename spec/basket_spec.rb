require 'basket'

describe Basket do

  let(:item) { double :dish }

  describe '#basket' do
    it 'begins as an empty array' do
    expect(subject.basket).to be_empty
    end 
  end

  describe 'order(item)' do
    it 'adds an item to the basket' do
    subject.order(item)
    expect(subject.basket).to include(item)
    end
  end
end 