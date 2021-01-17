require 'order'

describe Order do

  describe ' #add to order' do

  it { is_expected.to respond_to(:add_to_order).with(2).argument }
 # one version of double
  it 'can add dish to order' do
    order = double('order2', add_to_order: 1)
    order.add_to_order(:pizza, 1)
    expect(order.add_to_order(:pizza, 1)).to eq(1)
  end

end

describe ' #show order' do

  it { is_expected.to respond_to(:show_order)}
# another version of doubles set up.
  it 'can display the dishes and amount in order' do
    order = double("order3")
    allow(order).to receive(:show_order).and_return({})
    expect(order.show_order).to eq({})
  end

end

describe ' #total order value' do
  it 'can display the value of the order' do
    order = double("order4")
    allow(order).to receive(:total_value).and_return(2)
    expect(order.total_value).to eq(2)
  end
end
  describe ' #order summary' do
    it 'can display the order summary and the total to be paid' do
      order = double("order5")
      allow(order).to receive(:order_summary).and_return("string")
      expect(order.order_summary).to eq("string")
  end
end
end
