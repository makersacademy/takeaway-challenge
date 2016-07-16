require 'basket'

describe Basket do
 subject(:order) { described_class.new }

  it 'adds orders into an order log' do
    order.add("Mealworm Croquettes", 2)
    expect(order.basket["Mealworm Croquettes"]).to eq 2
  end


end
