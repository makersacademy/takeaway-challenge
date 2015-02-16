require 'order'

describe 'Order' do 
  order_class=Order
  let(:assistant){double :assistant, :confirm_order=>""}
  let(:customer){double :customer}
  let(:order){Order.new}
  
  it 'describes the thing' do 
    p order_class.test_customer_order(customer, order, assistant)
  end  
end  