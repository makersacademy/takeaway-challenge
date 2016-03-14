require 'price_calculator'
require 'dish'

describe PriceCalculator do
  subject(:price_calculator) {described_class.new(server)}
  let(:dish) {double :dish, name: "chow mein", price: 3.99}
  let(:dish2) {double :dish, name: "speceal fried rice", price: 4.50}
  let(:dish3) {double :dish, name: "sweet and sour chicken", price: 4.25}
  let(:selected_dishes) {{dish => 2, dish2 => 4, dish3 => 1}}
  let(:server) {double :server, total: 30.23}

  describe '#price' do
    it 'calculates the price correctly' do
      price_calculator.price(selected_dishes)
      expect(price_calculator.grand_total).to eq(server.total)
    end

    it 'sets up the subtotals array' do
      expect{price_calculator.price(selected_dishes)}.to change{price_calculator.subtotals}
    end

    it 'raises an error if the price calculation is not correct' do
      allow(server).to receive(:total) {35}
      expect{price_calculator.price(selected_dishes)}.to raise_error "Grand Total incorrect."
    end
  end

  context 'price calculation display' do
    it{is_expected.to respond_to(:grand_total)}
    it{is_expected.to respond_to(:subtotals)}
  end
end
