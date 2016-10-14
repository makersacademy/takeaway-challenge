require "spec_helper"

describe Restaurant do

  describe '#select' do
    it 'returns and error if the item is not on the list' do
      expect {subject.select(1000,1)}.to raise_error "You entered a number that does not corespond to our menu :( Please try again."
    end

    it 'returns and error if quantity is not a number' do
      expect {subject.select(1,"1")}.to raise_error "You entered an invalid quantity. Enter a number for the quantity"
    end

    it 'takes users order for correct inputs' do
      subject.select(1,2)
      expect(subject.select(2,1)).to eq([{:dish=>"fries", :price=>1.0, :quantity=>2}, {:dish=>"fish", :price=>1.5, :quantity=>1}])
    end
  end

  describe '#cart' do
    it 'returns error if user checks and the cart is empty' do
      expect { subject.cart }.to raise_error "Cart is empty"
    end

    it 'returns the contents of the cart' do
      subject.select(1,2)
      expect(subject.cart).to eq([{:dish=>"fries", :price=>1.0, :quantity=>2}])
    end
  end
end
