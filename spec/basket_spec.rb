require_relative '../lib/basket'

describe Basket do 

  let(:dish_double) {
    double :dish,
    name: :name_of_dish,
    price: :price_of_dish
  }
  let(:basket) { described_class.new }

  describe '#initialize' do

    describe 'creates a new basket' do

      it 'with an empty contents' do
        expect(basket.basket_contents).to be_empty
      end

      it 'with a 0 total' do
        expect(basket.basket_total).to eq 0
      end

    end

  end

  describe '#add_to_basket' do

    it 'adds dish to basket' do
      expect { basket.add_to_basket(dish_double) }.to change { basket.basket_contents }.to end_with(dish_double)
    end

  end

end
