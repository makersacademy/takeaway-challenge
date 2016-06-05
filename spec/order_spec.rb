require 'order'

describe Order do
  let(:order) { Order.new('Stephen Dawes', 123456, 'pieshop') }


  it 'should have a name' do
    expect(order.cust_name).to eq('Stephen Dawes')
  end

  it 'should have a number' do
    expect(order.cust_number).to eq(123456)
  end

  it 'should have a menu' do
    expect(order.menu_object).to eq('pieshop')
  end

  it 'should raise an error if item is not on the menu' do
    order.add_to_order("Chicken")
    expect {order.add_order}.to raise_error 'Item not on menu!'
  end

  it 'should add item to a customer order array' do
    order.add_to_order("Chicken Pie")
    expect(order.order).to include("Chicken Pie")
  end

end
