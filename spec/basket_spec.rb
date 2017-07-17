require 'basket'

describe Basket do
  subject(:basket) {Basket.new}
  let(:dish) {"Pig's brain"}
  let(:dish_price1) {8}
  let(:dish_price2) {12}

  describe '#add_price' do
    it 'should add price of a dish' do
    basket.add_price(dish_price1)
      expect(basket.prices).to eq [8]
    end
  end

  describe '#add_summary' do
    it 'should add dish name to summary' do
    basket.add_summary(dish)
    expect(basket.summary).to eq ["Pig's brain"]
    end
  end

  describe '#price' do
    it "should return the basket's price" do
      basket.add_price(dish_price1)
      basket.add_price(dish_price2)
      expect(basket.price).to eq 20
    end
  end

  describe '#try_complete' do
    it 'should return true when amount is equal to basket price' do
      basket.add_price(dish_price1)
      basket.add_price(dish_price2)
      expect(basket.is_correct?(20)).to be_truthy
    end
  end
end
