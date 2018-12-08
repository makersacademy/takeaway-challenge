require 'order'

describe Order do
  let(:order) {Order.new}
  let(:item) {double :item}

  it 'responds to #add' do
    expect(order).to respond_to(:add)
  end

  it 'starts with an empty order' do
    expect(order.total_order).to eql([])
  end

  it '#add enters items to total_order' do
    order.add(item)
    expect(order.total_order).to eq([item])
  end

  it 'can add multiple items from single #order' do
   order.add(item, 3)
   expect(order.total_order).to eq([item, item, item])
 end


end