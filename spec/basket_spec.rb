require_relative '../lib/basket'

describe Basket do 

  let(:dish_double) {
    double :dish,
    name: :name_of_dish,
    price: 6
  }
  let(:another_dish_double) {
    double :dish,
    name: :name_of_another_dish,
    price: 12
  }
  let(:a_third_dish_double) {
    double :dish,
    name: :name_of_a_third_dish,
    price: 5
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

    it 'updates the basket total wit the price of the dish' do
      expect { basket.add_to_basket(dish_double) }.to change { basket.basket_total }.by(dish_double.price)
    end

  end

  describe '#view_basket' do 

    it 'displays selected items and running total' do # Can I split this test?
      basket.add_to_basket(dish_double)
      2.times { basket.add_to_basket(another_dish_double) }
      basket.add_to_basket(dish_double)
      basket.add_to_basket(a_third_dish_double)
      expect { basket.view_basket }.to output(
"Item: #{a_third_dish_double.name} Number: 1 Subtotal: £ #{a_third_dish_double.price * 1}
Item: #{another_dish_double.name} Number: 2 Subtotal: £ #{another_dish_double.price * 2}
Item: #{dish_double.name} Number: 2 Subtotal: £ #{dish_double.price * 2}
Basket total price: £ 41.00\n"
      ).to_stdout 
    end

  end

  describe '#basket_and_items_totals_match?' do

    # context 'where running total not same as total price of all items in basket' do

    #   let(:items_total) { basket.items_total - 5 }

    #   it 'returns false' do
    #     expect(basket.basket_and_items_totals_match?).to eq false
    #   end
    # end

    context 'where running total is same as total price of all items in basket' do
      it 'returns true' do
        items_total = basket.items_total
        if basket.basket_total == items_total
          expect(basket.basket_and_items_totals_match?).to eq true
        end
      end
    end

  end

  describe '#items_total' do
    it 'adds up the prices of the items in the basket' do
      basket.add_to_basket(dish_double)
      2.times { basket.add_to_basket(another_dish_double) }
      basket.add_to_basket(dish_double)
      basket.add_to_basket(a_third_dish_double)
      expect(basket.items_total).to eq 41.0
    end
  end
end
