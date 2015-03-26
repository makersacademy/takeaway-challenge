require 'Order'

describe Order do
  
  let(:order){ Order.new(maximum_order: 10) }
  let(:frosties){ double :dish, price: 2.50 }
  let(:coco_pops){ double :dish, price:4.20 }

  it 'should have a maximum order value' do
    expect(order.maximum_order).to eq 10
  end

  it 'should let you add cereal to your order' do
    order.add_cereal(frosties, 1)
    expect(order.orders).to include (frosties)
  end

  it 'knows how many of each item are in the order' do
    order.add_cereal(frosties, 2)
    order.add_cereal(coco_pops, 3)
    expect(order.item_count).to eq (5)
  end

  it 'can calculate the total of an order' do
    order.add_cereal(frosties, 2)
    order.add_cereal(coco_pops, 3)
    expect(order.order_total).to eq (17.60)
  end

end