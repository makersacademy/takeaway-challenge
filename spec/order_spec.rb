require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:dish) {double(:dish)}

  it 'holds dishes in an array' do
    order.items << dish
    expect(order.items[0]).to eq dish
  end

  it 'stores the total price of order' do
    order.total = 10
    expect(order.total).to eq 10
  end

end
