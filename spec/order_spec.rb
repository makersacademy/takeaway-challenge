require './lib/order'


describe Order do

  let(:dish1) {double :dish1, info: {:price => 6, :name => 'Garden salad', :category => 'Side dish'}}
  let(:dish2) {double :dish2, info: {:price => 6, :name => 'Ceasar salad', :category => 'Side dish'}}
  let(:menu) {double :menu, dishes: [:dish1, :dish2] }
  let(:order) {Order.new('+447595593385',:menu)}

  it 'should have a phone number when intialized' do
    expect(order.phone_number).to eq('+447595593385')
  end

  it 'should receive a dish and quantity' do

    #p menu.dishes
    #order.add_item('Garden salad', 3)
    #expect(order.dishes[dish1]).to eq(3)

  end

  it 'should raise an error if the item added to the order does not exist' do
    # order.add_item(dish1, 1)
    # expect {order.submit_order}.to raise_error 'order is below minimum'
  end

  it 'should know the total amount' do
    # order.add_item(dish1, 3)
    # expect(order.total).to eq(18)
  end

  it 'should know if the total is above the minimum' do
    # order.add_item(dish1, 3)
    # expect(order).to be_above_minimum
  end

  it 'should raise an error if an order is submitted below the minimum' do
    # order.add_item(dish1, 1)
    # expect {order.submit_order}.to raise_error 'order is below minimum'
  end
  
end






