require 'order'

describe Order do
  let(:order) { Order.new('Stephen Dawes', 123_456, 'pieshop') }
  let(:total_cost) { 9 }


  it 'should have a name' do
    expect(order.cust_name).to eq('Stephen Dawes')
  end

  it 'should have a number' do
    expect(order.cust_number).to eq(123_456)
  end

  it 'should have a menu' do
    expect(order.menu_object).to eq('pieshop')
  end

  it 'should raise an error if item is not on the menu' do
    # order.add_to_order("Chicken", 2)
    # expect {order.add_order}.to raise_error 'Item not on menu!'
  end

  it 'should add item to a customer order array' do
    # order.add_to_order("Chicken Pie", 2)
    # expect(order.order).to include("Chicken Pie")
  end

  it 'add the total cost of the items' do
    order.add_to_order("Chicken Pie", 2)
    expect(order.total_cost).to eq(total_cost)
  end

  it 'adds the total number of items in order' do

  end

end
