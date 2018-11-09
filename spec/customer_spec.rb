require 'customer'

describe Customer do
  let(:order) { double(:order, :build => true) }
  subject(:customer) { Customer.new("Will", "07539204924", order) }
  it 'can select a number of available dishes' do
    expect(customer.select_dishes([1, 2])).to eq(true)
  end
end
