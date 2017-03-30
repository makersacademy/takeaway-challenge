require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:dish) {double(:dish)}
  let(:burger) { Dish.new("Burger", 10)}

  it 'holds dishes in an array' do
    order.items << dish
    expect(order.items[0]).to eq dish
  end

  # it 'stores the total price of order' do
  #   order.total = 10
  #   expect(order.total).to eq 10
  # end

  it 'calculates total based on dishes in @items array' do
    3. times { order.items << burger }
    expect(order.total).to eq(30)
  end

end
