require 'customer'

describe Customer do
  let(:order) { double(:order, :build => true, print: "your order") }
  subject(:customer) { Customer.new("Will", "07539204924", order) }
  it 'can select a number of available dishes' do
    expect(customer.select_dishes([1, 2])).to eq(true)
  end

  it 'can varify order' do
    customer.select_dishes([1, 2])
    expect(customer.varify_order).to eq("your order")
  end
end
