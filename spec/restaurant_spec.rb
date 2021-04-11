require 'restaurant'
require 'customer'

describe Restaurant do
  customer = Customer.new
  it 'instantiates' do
    expect(subject).to be_instance_of(Restaurant)
  end

  it 'responds to menu feature' do
    expect(subject).to respond_to(:menu)
  end

  it 'responds to format menu feature' do
    expect(subject).to respond_to(:format_menu)
  end
  #is this the right kind of test?
  it 'calculates the bill correctly' do
    o = customer.make_order({"antipasti" => 1, "irish coffee" => 3})
    expect(subject.calculate_bill(o)).to eq(16)
  end
end
