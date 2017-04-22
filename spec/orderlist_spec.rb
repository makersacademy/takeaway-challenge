require 'orderlist'

describe Orderlist do

  let(:orderlist){ described_class.new }
  let(:dish) { double :dish, name: 'Fruit basket', price: 10.99 }

  it 'retains orders' do
    orderlist.add(dish)
    expect(orderlist.show_contents).to include(dish)
  end

end
