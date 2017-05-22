require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish) { double(:dish) }

  it 'when starting the order, there is nothing listed' do
    expect(order.items).to eq []
  end

  it 'can have dishes added to items' do
    order.items << dish
    expect(order.items[-1]).to eq dish
  end

  it 'stores the cost of the total order' do
    order.total_cost = 10
    expect(order.total_cost).to eq 10
  end
end
