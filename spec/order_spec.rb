require 'order'
require 'menu'

describe Order do

  let(:new_order) {Order.new}

  it "allows the selection of several dishes to be added to an order" do
    new_order.add_to_order("Balti", 4)
    new_order.add_to_order("Vindaloo",2)
    expect(new_order.order.count).to eq 3
  end

  it 'calculates a total sales value' do
    new_order.add_to_order("Balti", 4)
    new_order.add_to_order("Vindaloo",2)
    expect(new_order.order_total).to eq 29.0
  end
end
