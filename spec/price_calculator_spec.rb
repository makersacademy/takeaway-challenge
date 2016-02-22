require 'price_calculator'
require 'dish'

describe PriceCalculator do
  subject(:price_calculator) {described_class.new(server)}
  let(:selected_dishes) {{dish => 2, dish2 => 4, dish3 => 1}}
  let(:dish) {double :dish}
  let(:dish2) {double :dish}
  let(:dish3) {double :dish}
  let(:server) {double :server, total: 35}
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
      allow(server).to receive(:total) {30.23}
      price_calculator.price(selected_dishes)
      expect(price_calculator.grand_total).to eq(server.total)
    end

    it 'raises an error if the price calculation is not correct' do
      expect{price_calculator.price(selected_dishes)}.to raise_error "Grand Total incorrect."
    end

    context 'price calculation display' do
      it 'displays the subtotal for the quantity of each dish' do

      end

      it 'displays the grand total of the order' do

      end
    end
  end

end
