require 'basket'

describe Basket do
  let(:dishes) { double(:dishes) }

  it 'allows you to select a meal' do
    expect(subject.select_meal({chicken_bhuna: 1, pilau_rice: 1})).to eq({
      chicken_bhuna: 1,
      pilau_rice: 1})
  end

  it 'checks the price is correct' do
    items_and_quantities = ({chicken_bhuna: 1, pilau_rice: 1})
    dish_prices_and_quantities = ({4.25 => 1, 2 => 1})
    subject.select_meal(items_and_quantities)
    allow(dishes).to receive(:select_prices).and_return [4.25, 2]
    subject.total_order_price(items_and_quantities, dishes)
    expect(subject.correct_total_price?(dish_prices_and_quantities, dishes)).to eq true
  end
end
