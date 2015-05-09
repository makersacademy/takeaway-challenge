require 'customer'
require 'menu'

describe Customer do
  let (:takeaway) { double :takeaway }

  before do
    allow(takeaway).to receive(:list).and_return ({'red curry' => 5, 'green curry' => 5})
    allow(takeaway).to receive(:register_order)

  end

  it 'can see the menu' do
    customer = Customer.new { takeaway }
    expect(customer.see_menu).to eq({'red curry' => 5, 'green curry' => 5})
  end

  it 'can place an order' do
    customer = Customer.new { takeaway }
    customer.place_order(2, "red curry")

    allow(takeaway).to receive(:order).and_return (['red curry' => 5, 'red curry' => 5])
    expect(customer.takeaway.order).to eq (['red curry' => 5, 'red curry' => 5])
  end

  it
end