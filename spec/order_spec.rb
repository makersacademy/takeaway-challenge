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
    order.add("Peroni")
    expect(order.total_order).to eq(["Peroni"])
  end

  it 'can add multiple items from single #order' do
   order.add("Green salad, 3")
   expect(order.total_order).to eq(["Green salad", "Green salad", "Green salad"])
  end

  it 'returns summary of ordered items and cost' do
    order.add("Peroni, 3")
    expect(order.summary).to eq("         Total ........ £13.50          ")
  end

end