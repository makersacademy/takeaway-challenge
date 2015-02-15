require 'customer'

describe Customer do
  it 'should have nothing in their order to start with' do
    customer = Customer.new
    expect(customer.order).to eq []
  end

  it 'can add an item to an order' do
    customer = Customer.new
    customer.add_to_order(:sandwich)
    expect(customer.order).to eq [:sandwich]
  end

  it 'can add multiples of an item to an order' do
    customer = Customer.new
    customer.add_to_order(:sandwich, 2)
    expect(customer.order).to eq [:sandwich, :sandwich]
  end

  it 'can place an order to a takeaway' do
    customer = Customer.new
    takeaway = double :takeaway
    customer.add_to_order(:sandwich)
    customer.add_to_order(:salad)
    expect(takeaway).to receive(:check_order).with([:sandwich, :salad], 11)
    customer.order_from(takeaway, 11)
  end

end