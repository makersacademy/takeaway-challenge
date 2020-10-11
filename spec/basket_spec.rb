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

    it 'adds an item and quantity to the basket which is a hash' do
    subject.add_to_basket("Double Double", 1)
    expect(subject.basket).to include({"Double Double" => 1})
    end

    it 'adds an items price to the order total' do
    subject.add_to_basket("Double Double", 2)
    subject.add_to_basket("Milkshake", 1)
    expect(subject.order_total).to eq 9
    end

    it 'raises an error if somebody tries to add an item that does not exist on the menu' do 
    expect { subject.add_to_basket("4x4", 4) }.to raise_error("Not a valid item, please select again")
    end
  end

#   describe '#complete_order' do
#     before do
#         subject.add_to_basket

#     it 'shows the order to the customer with items, quantities and total price' do

end 