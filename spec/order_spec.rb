require './lib/order'

describe Order do
  let(:order) { Order.new }
  let(:dish) { Dish.new("Dumpling", 1.99) }

  it "initliazes as an empty list" do
    expect(order.list_of_orders).to be_empty
  end

  describe '#add_order' do
  it 'adds dishes to the order list' do
    order.add_order("Dumpling", 1)
    expect(order.list_of_orders.last.name).to eq("Dumpling")
  end

  it 'should add more than one dish' do
    expect { order.add_order("Dumpling", 2) }.to change { order.list_of_orders.length }.by(2)
  end
end
end
