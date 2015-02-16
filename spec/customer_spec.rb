require 'customer'
require 'menu'

class Customer_Class; include Customer; end

describe Customer do
  let(:customer){Customer_Class.new}

it 'should receive a text with a delivery time' do
  customer.send_text
  #check phone to confirm that a customer can receive text
end





end

