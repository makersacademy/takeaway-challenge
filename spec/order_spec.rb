require 'order'
require 'menu'

describe Order do
 subject(:order) { described_class.new }

  it 'adds orders into an order log' do
    order.add("Mealworm Croquettes", 2)
    expect(order.basket["Mealworm Croquettes"]).to eq 2
  end

  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'shows the summary of the basket' do
    order.add("Mealworm Croquettes", 2)
    expect(order.order_summary).to eq("2: Mealworm Croquettes")
  end

end
