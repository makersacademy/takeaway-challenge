require 'customer'

describe Customer do

  let(:customer) { Customer.new("Paul", +123456) }
  let(:takeaway) {double :takeaway}
  let(:dishes) {double :dishes}
  let(:customer_total) {double :customer_total}

  it 'has a name' do
    expect(customer.name).to eq "Paul"
  end

  it 'has a phone number' do
    expect(customer.phone_number).to eq +123456
  end

  it 'can order food from the takeaway' do
    expect(takeaway).to receive(:take_order)
    customer.place_order(takeaway, dishes, customer_total)
  end
end