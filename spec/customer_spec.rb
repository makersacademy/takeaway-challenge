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

end