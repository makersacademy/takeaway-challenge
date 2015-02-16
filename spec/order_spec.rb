require 'order'
require 'customer'
require 'nil'


describe Order do
  let(:order){Order.new}
  let(:customer){double :Customer}
  let(:customer_order){ order.select_items({"Duck Rice" => 8, "Gyoza" => 5, "Mango" => 3}) }
  let(:small_order){ order.select_items({"Duck Rice" => 8}) }


  it 'should allow customer to select items' do
    customer_order
    expect(order.select_items(items)).to eq order.basket
  end

  it 'should allow customer to change the quantity of items' do
  end

  it 'should put selected items in an order basket' do
    expect(customer_order).to eq order.basket
  end

  it 'should calculate a total order value' do
    customer_order
    expect(order.total_value).to eq 16
  end

  it 'should recognise an insufficient order' do
    small_order
    expect(order.insufficient_order).to eq true
  end

  it 'should reject an order that does not meet a minimum order value' do
    small_order
    expect{order.submit_order}.to raise_error(RuntimeError, "You haven't reached the minimum order value of £10, please add to your order.")
  end

  xit 'should send the customer a text using Twillio' do
    customer_order
    expect(order.submit_order).to eq order.send_text #text successfully sends to phone
  end


end