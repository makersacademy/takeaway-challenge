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

  it 'by default #add enters single item to total_order' do
    order.add("Beer")
    expect(order.total_order).to eq(["Beer"])
  end

  it 'can add multiple items from single #order' do
   order.add("Beer 3")
   expect(order.total_order).to eq(["Beer", "Beer", "Beer"])
 end


end