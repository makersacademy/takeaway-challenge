require './lib/customer.rb'
require './lib/menu.rb'

describe Customer do

  let(:customer) {Customer.new}
  let(:order)    {Order.new}

  it 'can check the menu' do
    expect(customer.check_menu).to include('pepperoni pizza' => 5.00, 'spaghetti pomodoro' => 6.00, 'spaghetti carbonara' => 7.50)
  end

  it 'can verify that the bill is correct' do
    order.add_item("spaghetti pomodoro", 1)
    expect(customer.verify_bill(order, 6.00)).to eq 'bill is correct'
  end

end
