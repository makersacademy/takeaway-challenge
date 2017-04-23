require 'order'
require 'takeaway'

describe Order do
  subject(:order) { described_class.new }
  let(:takeaway) { described_class.new }
  let(:customer_order) do
    {
      Milano: 1,
      Roma:   1
    }

  end
  it 'allows the customer to order several items' do
    new_order
    expect(order.customer_order).to eq customer_order
  end

  it 'raises error if item ordered is not on the menu' do
    error = "Item is not on the menu."
    expect { order.add_item(:Margherita, 1) }.to raise_error error
  end

  it 'checks the total matches the sum of the various items ordered' do
    new_order
    expect(order.total).to eq "Your total: £39.98"
  end

  def new_order
    order.add_item(:Milano, 1)
    order.add_item(:Roma, 1)
  end
end
