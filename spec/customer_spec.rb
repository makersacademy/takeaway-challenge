require './lib/customer.rb'
require './lib/menu.rb'

describe Customer do

  let(:customer) { Customer.new { include Menu } }
  let(:order)    { Order.new }

  it 'can check the menu' do
    expect(customer.check_menu).to include(
    :pepperoni_pizza => 5.00,
    :spaghetti_pomodoro => 6.00,
    :spaghetti_carbonara => 7.50)
  end

  it 'verifies that the bill is correct' do
    order.add_item(:spaghetti_pomodoro, 1)
    expect(customer.verify_bill(order, 6.00)).to eq 'Bill is correct'
  end

  it 'raises an error if bill is incorrect' do
    order.add_item(:spaghetti_pomodoro, 1)
    expect{customer.verify_bill(order, 4.00)}.to raise_error 'Incorrect bill'
  end

  it 'is able to complete the order' do
    expect(customer.complete_order).to eq('Thank you for your order!')
  end

  it 'receives a text upon completing order' do

  end
end
