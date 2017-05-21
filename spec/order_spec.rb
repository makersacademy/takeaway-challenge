require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'adds a dish to the order' do
    order.add_to_order("Cheeseburger", 2)
    expect(order.selection).to eq [{ "Cheeseburger" => 2 }]
  end

  it 'calculates the price of the each item in order' do
    order.add_to_order("Cheeseburger", 2)
    expect(order.calculate_price).to eq [10]
  end

  it 'calculates the total cost of the order' do
    order.add_to_order("Cheeseburger", 1)
    order.add_to_order("BBQ Ranch Burger", 2)
    expect(order.calculate_total).to eq 21
  end

  it 'should give you your total price' do
    order.add_to_order("Cheeseburger", 1)
    order.add_to_order("BBQ Ranch Burger", 2)
    expect(order.display_total).to eq "Your total for this order is £21."
  end

  # it 'should raise an error if the total is incorrect' do
  #   expect { order.display_total }.to raise_error("Ooops! Error! Try Again!")
  # end
end
