require 'customer'

describe Customer do
  
  it 'can place items into an order' do
    customer = Customer.new
    sandwich = double :sandwich
    salad = double :salad

    customer.choose(1, sandwich)
    customer.choose(2, salad)
    expect(customer.order).to eq [sandwich, salad, salad]
  end

end