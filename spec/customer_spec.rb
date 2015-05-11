require 'customer'
require 'menu'

describe Customer do
  let (:takeaway) { double :takeaway }

  before do
    allow(takeaway).to receive(:list).and_return ({'red curry' => 5, 'green curry' => 5})
    allow(takeaway).to receive(:register_order)

  end

  it 'can see the menu' do
    customer = Customer.new { takeaway }
    expect(customer.see_menu).to eq({'red curry' => 5, 'green curry' => 5})
  end

  it 'can place an order' do
    customer = Customer.new { takeaway }
    customer.place_order(1, "red curry")
    allow(takeaway).to receive(:order).and_return ([{'red curry' => 5}])
    expect(customer.takeaway.order).to eq ([{'red curry' => 5}])
  end

  it 'can receive an order confirmation' do
    customer = Customer.new { takeaway }
    time = Time.new
    customer.place_order(1, "red curry")
    allow(takeaway).to receive(:register_order)
    allow(takeaway).to receive(:calculate_order)
    allow(takeaway).to receive(:amount_due).and_return(5)
    allow(takeaway).to receive(:set_confirmation)
    allow(takeaway).to receive(:confirmation).and_return ("Thank you! Your order was placed and will be delivered before #{(time.hour) +1}:#{time.min}. The amount due is 5$")
    customer.ask_confirmation
    expect(customer.ask_confirmation).to eq ("Thank you! Your order was placed and will be delivered before #{(time.hour) +1}:#{time.min}. The amount due is 5$")
  end
end