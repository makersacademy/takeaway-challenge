require 'order'
require 'customer'
require 'nil'


describe Order do
  let(:order){Order.new}
  let(:customer){double :Customer}
  let(:menu){double :Menu}

  it 'should allow customer to select items' do
    order.select_items({"Duck Rice" => 8, "Gyoza" => 5, "Mango" => 3})
    expect(order.select_items(items)).to eq order.basket
  end

  # it 'should allow customer to change the quantity of items' do
  #   expect{order.change_quantity({"Duck Rice" => 8}) * 6}.to change{order.basket_count}.by 6
  # end

  it 'should calculate a total order value' do
    order.select_items({"Duck Rice" => 8, "Gyoza" => 5, "Mango" => 3})
    expect(order.total_value).to eq 16
  end

  it 'should reject an order that does not meet a minimum order value' do
    order.select_items({"Duck Rice" => 8})
    expect{order.submit_order}.to raise_error(RuntimeError, "You haven't reached the minimum order value of £10, please add to your order.")
  end

  it 'should submit an order using Twillio' do
    order.select_items({"Duck Rice" => 8, "Gyoza" => 5, "Mango" => 3})
    expect(order.submit_order).to eq "ACTIVATE TWILIO" #function to be implemented
  end

end

