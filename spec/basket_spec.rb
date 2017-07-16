require 'basket'

describe Basket do
  subject(:basket) {Basket.new}
  let(:dish) {"Margherita"}
  let(:dish_price1) {8}
  let(:dish_price2) {12}

  describe '#add_price' do
    it 'should return dishes when added to the basket' do
    basket.add_price(dish_price1)
      expect(basket.prices).to eq [8]
    end
  end

  describe '#add_summary' do
    it 'should return dishes when added to the basket' do
    basket.add_summary(dish)
    expect(basket.summary).to eq ["Margherita"]
    end
  end

  describe '#price' do
    it 'should return the price' do
      basket.add_price(dish_price1)
      basket.add_price(dish_price2)
      expect(basket.price).to eq 20
    end
  end

  describe '#try_complete' do
    it 'should return true when amount' do
      basket.add_price(dish_price1)
      basket.add_price(dish_price2)
      expect(basket.is_correct?(20)).to be_truthy
    end
  end
end
