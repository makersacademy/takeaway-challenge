require 'orderlist'

describe Orderlist do

  let(:orderlist){ described_class.new }
  let(:order) { double :order, description: 'Fruit basket', price: 10.99 }

  it 'retains orders' do
    orderlist.add(order)
    expect(orderlist.show_contents).to include(order)
  end

end
