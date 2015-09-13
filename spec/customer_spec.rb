require './lib/customer.rb'
require './lib/menu.rb'

describe Customer do

  let(:customer) { Customer.new { include Menu } }
  let(:order)    { Order.new.add_item(:spaghetti_pomodoro, 1) }

  it 'can check the menu' do
    expect(customer.check_menu).to include(
    :pepperoni_pizza => 5.00,
    :spaghetti_pomodoro => 6.00,
    :spaghetti_carbonara => 7.50)
  end

  it 'can verify and complete order if payment is correct' do
    allow(order).to receive(:order_total) {true}
    expect(customer.verify_and_pay(order, 6.00)).to eq 'Thank you, payment has been accepted. You will shortly receive a confirmation text message.'
  end

  it 'raises an error if payment is incorrect' do
    allow(order).to receive(:order_total) {false}
    expect{customer.verify_and_pay(order, 4.00)}.to raise_error 'Payment failed, please pay correct total.'
  end

end
