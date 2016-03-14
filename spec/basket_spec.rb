require 'basket'

describe Basket do

  subject(:basket) { described_class.new }
  let(:dish1) { {name: 'sushi', amount: 5, price: 7} }
  let(:dish2) { {name: 'tofu salad', amount: 4, price: 4.5} }
  let(:dish2_half) { {name: 'tofu salad', amount: 2, price: 4.5} }
  let(:dish3) { {name: 'miso soup', amount: 2, price: 1.5} }

  describe '#initialize' do
    it '0.0 initializes with an empty basket' do
      expect(basket.content).to be_empty
    end
  end

  describe '#add' do
    before(:each) do
      basket.add(dish1)
      basket.add(dish2)
    end
    it '1.0 adds dish to the basket' do
      expect(basket.content).to include(dish1 && dish2)
    end
    it '1.1 ammends the amount of the dish already in basket' do
      basket.add(dish1)
      expect(basket.content).to include({name: 'sushi', amount: 10, price: 7})
    end
  end

  describe '#remove' do
    before(:each) do
      basket.add(dish1)
      basket.add(dish2)
    end
    it '2.0 removes dish from the basket if qty becomes zero' do
      basket.remove(dish2)
      expect(basket.content).not_to include(dish2)
    end
    it '2.1 ammends the amount of the dish already in basket' do
      basket.remove(dish2_half)
      expect(basket.content).to include(dish2_half)
    end
    it '2.2 raises an error if the given dish is not in the basket' do
      message = 'None in the basket'
      expect{basket.remove(dish3)}.to raise_error message
    end
  end

  describe '#show_summary' do
    it '3.0 calculates the actual total' do
      basket.add(dish1)
      basket.add(dish2)
      basket.add(dish3)
      expect(basket.show_summary).to eq(56)
    end
    it '3.1 raises an error if basket is empty' do
      message = 'Basket is empty'
      expect{basket.show_summary}.to raise_error message
    end
  end
end
