require 'order_calculator'

describe OrderCalculator do

  subject(:order_calculator) {described_class.new}
  let(:dish_tikka){double(:dish_tikka, name: "Tikka Masala", price: 7)}
  let(:dish_chow){double(:dish_chow, name: "Chow Mein", price: 6)}
  let(:dishes_ordered) {[{dish: dish_tikka, quantity: 3}, {dish: dish_chow, quantity: 2}]}

  it 'expects verified? to return false if total and sum don\'t match' do
    expect(order_calculator.verified?(100, dishes_ordered)).to eq false
  end

  it 'expects verified? to return true if total and sum match' do
    expect(order_calculator.verified?(33, dishes_ordered)).to eq true
  end

end
