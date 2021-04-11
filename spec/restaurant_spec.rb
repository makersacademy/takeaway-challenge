require 'restaurant'
require 'customer'
# require 'secrettwilio'
# require 'twilio-ruby'

describe Restaurant do
  customer = Customer.new
  it 'instantiates' do
    expect(subject).to be_instance_of(Restaurant)
  end

  it 'responds to menu attribute' do
    expect(subject).to respond_to(:menu)
  end

  it 'responds to #format_menu' do
    expect(subject).to respond_to(:format_menu)
  end

  it 'responds to #calculate_bill' do
    expect(subject).to respond_to(:calculate_bill).with(1).argument
  end

  #is this the right kind of test?
  it 'calculates the bill correctly' do
    o = customer.make_order({"antipasti" => 1, "irish coffee" => 3})
    expect(subject.calculate_bill(o)).to eq(16)
  end
end
