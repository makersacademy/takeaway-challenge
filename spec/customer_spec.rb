require 'customer'

describe Customer do
  let(:order) { double(:order, :build => true, print: "your order", varify: true) }
  subject(:customer) { Customer.new("Will", "07539204924", order) }
  it 'can select a number of available dishes' do
    expect(customer.select_dishes([1, 2])).to eq(true)
  end

  it 'can varify order' do
    customer.select_dishes([1, 2])
    customer.varify_order
    expect(customer.print_order).to eq("your order")
    expect(customer.varify_order).to eq(true)
  end
end
