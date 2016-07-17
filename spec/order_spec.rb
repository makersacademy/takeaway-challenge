require 'order'
require 'menu'

describe Order do

  let(:new_order) {Order.new("balti",4)}

  it "allows the selection of several dishes to be added to an order" do
    # new_order.dish = "balti"
    # new_order.quantity = 4
    new_order.add_to_order
    expect(new_order.order.count).to eq 4
  end
end
