require 'basket'

describe Basket do

  describe '#basket' do
    it 'begins as an empty array' do
    expect(subject.basket).to be_empty
    end 
  end

  describe 'order_total' do 
    it 'begins with a value of zero' do
    expect(subject.order_total).to eq 0
    end
  end 

  describe 'add_to_basket(item)' do

    it 'adds an item to the basket' do
    subject.add_to_basket("Double Double")
    expect(subject.basket).to include("Double Double")
    end

    it 'adds an items price to the order total' do
    subject.add_to_basket("Double Double")
    subject.add_to_basket("Double Double")
    subject.add_to_basket("Milkshake")
    expect(subject.order_total).to eq 9
    end
  end

end 