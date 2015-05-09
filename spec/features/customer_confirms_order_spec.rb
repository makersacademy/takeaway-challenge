require 'twilio'
require 'customer'

feature 'Customer has made order' do
  let (:customer) {Customer.new{Takeaway.new}}
  scenario 'and receives a text message' do
    allow(customer).to receive(:confirm_order).and_return(true)
    expect(customer.confirm_order).to eq true
  end

  scenario 'raises an error if order is empty' do
    expect{customer.confirm_order}.to raise_error "No order to confirm"
  end
end