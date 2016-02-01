require 'price_calculator'
require 'dish'

describe PriceCalculator do
  subject(:price_calculator) {described_class.new}
  let(:selected_dishes) {{dish => 2, dish2 => 4, dish3 => 1}}
  let(:dish) {double :dish}
  let(:dish2) {double :dish}
  let(:dish3) {double :dish}
  before do
    allow(dish).to receive(:name) {:chow_mein}
    allow(dish2).to receive(:name) {:special_fried_rice}
    allow(dish3).to receive(:name) {:sweet_and_sour_chicken}
    allow(dish).to receive(:price) {3.99}
    allow(dish2).to receive(:price) {4.50}
    allow(dish3).to receive(:price) {4.25}
    allow(selected_dishes).to receive(:quantity) do
      {dish => 2, dish2 => 4, dish3 => 1}
    end
  end

  context '#price calculation' do
    it 'calculates the price correctly' do
      price_calculator.price(selected_dishes)
      expect(price_calculator.grand_total).to eq(selected_dishes.quantity[dish] * dish.price + selected_dishes.quantity[dish2] * dish2.price + selected_dishes.quantity[dish3] * dish3.price)
    end

    it 'raises an error if the price calculation is not correct' do

    end

    context 'price calculation display' do
      it 'displays the subtotal for the quantity of each dish' do

      end

      it 'displays the grand total of the order' do

      end
    end
  end

end
