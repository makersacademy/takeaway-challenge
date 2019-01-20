require 'basket'

describe Basket do

  describe '#new' do
    it 'creates an empty array' do
      expect(subject.basket).to be_empty
    end
  end

  describe '#add_to_basket' do
    it 'responds to the add_to_basket method' do
      expect(subject).to respond_to(:add_to_basket)
    end
    it 'allows the add_to_basket method to take one argument' do
      expect(subject).to respond_to(:add_to_basket).with(1).argument
    end
    it 'takes item code, and adds the required hash to order' do
      subject.add_to_basket(2)
      expect(subject.basket).to eq([{ item_code: 2, item: "haddock", price: 5 }])
    end
    context '#raising errors' do
      it 'raises error when the item code is a string' do
        expect{ subject.add_to_basket("garbage") }.to raise_error("Please enter a valid item code.")
      end
      it 'raises error when the item code is below 1' do
        expect { subject.add_to_basket(0) }.to raise_error("Please enter a valid item code.")
      end
      it 'raises error when the item code is above 10' do
        expect { subject.add_to_basket(88) }.to raise_error("Please enter a valid item code.")
      end
    end
  end

  describe '#remove_from_basket' do
    it 'responds to the remove_from_basket method' do
      expect(subject).to respond_to(:remove_from_basket)
    end
    it 'allows the remove_from_basket method to take one argument' do
      expect(subject).to respond_to(:remove_from_basket).with(1).argument
    end
  end
end
