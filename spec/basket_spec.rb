require 'basket'

describe Basket do

  describe '#new' do
    it 'creates an empty array' do
      expect(subject.basket).to be_empty
    end
  end

  describe '#add_to_basket' do
    it 'allows the add_to_basket method to take two argument' do
      expect(subject).to respond_to(:add_to_basket).with(2).argument
    end
    it 'takes item code and quantity, and adds to basket' do
      subject.add_to_basket(2, 2)
      expect(subject.basket).to eq([{ item_code: 2, item: "haddock", price: 5 }, { item_code: 2, item: "haddock", price: 5 }])
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

  # describe '#remove_from_basket' do
  #   it 'allows the remove_from_basket method to take two argument' do
  #     expect(subject).to respond_to(:remove_from_basket).with(2).argument
  #   end
  #   it 'takes item code and quantity, and deletes from basket' do
  #     basket = Basket.new
  #     subject.add_to_basket(2, 2)
  #     subject.remove_from_basket(2)
  #     expect(basket.basket).to eq [{ item_code: 2, item: "haddock", price: 5 }]
  #   end
  #   context '#raising errors' do
  #     it 'raises an error if the basket is empty' do
  #       expect { subject.remove_from_basket(2) }.to raise_error("Error. Your basket is already empty.")
  #     end
  #     it 'raises error when the item code is below 1' do
  #       basket = Basket.new
  #       subject.add_to_basket(2, 2)
  #       expect { subject.remove_from_basket(0) }.to raise_error("Please enter a valid item code.")
  #     end
  #     it 'raises error when the item code is above 10' do
  #       basket = Basket.new
  #       subject.add_to_basket(2, 2)
  #       expect { subject.remove_from_basket(88) }.to raise_error("Please enter a valid item code.")
  #     end
  #   end
  # end

  describe '#basket_summary' do
    it 'returns all items in basket and a running total' do
      subject.add_to_basket(2)
      expect(subject.basket_summary).to eq("Total cost: £5")
    end
  end

  describe '#cost' do
    it 'returns the total basket cost at that time' do
      subject.add_to_basket(2, 2)
      subject.add_to_basket(1)
      expect(subject.cost).to eq 15
    end
  end
end
