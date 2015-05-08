require 'twilio'
require 'customer'

feature 'Customer has made order' do
  scenario 'and receives a text message' do
    customer = Customer.new {Takeaway.new}
    #add a stub for controlling method behaviour
    expect(customer.confirm_order).to eq "Thank you! Your order was placed and will be delivered before (insert Time function)"
  end
end