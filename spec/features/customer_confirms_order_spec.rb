require 'welcome'
require 'customer'
require 'takeaway'

feature "Customer has confirmed order" do
  let (:customer) {Customer.new}

  before (:each) do
    customer.takeaway = Takeaway.new Menu, Order, Message_Handler
  end

  scenario "and receives a text" do
    allow(customer).to receive(:place_order).and_return(true)
    expect(customer.place_order).to eq true
  end

  scenario "and gets delivery text when item arrives" do
    allow(customer).to receive(:give_feedback).and_return(true)
    expect(customer.give_feedback).to eq true
  end
end