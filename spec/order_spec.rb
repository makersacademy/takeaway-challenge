require 'order'


describe 'Order' do

  food = { 'fish':5.0,
           'cake':2.99,
           'beef':7.0}
  let(:current_order){Order.new}
  let(:menu){ double('menu', menu: food) }

  it 'can form an order from selected menu items' do
    order = {fish:5.0}
    allow(menu).to receive(:select_food).and_return(order)
    expect(current_order.add('fish', menu)).to eq order
  end

  it 'can form an order from 2 selected menu items' do
    order = {cake:2.99, fish:5.0}
    allow(menu).to receive(:select_food).and_return( cake:2.99 )
    current_order.add('cake', menu)
    allow(menu).to receive(:select_food).and_return( fish:5 )
    expect(current_order.add('fish', menu)).to eq order
  end

  it 'returns the total price of the order' do
    order = {fish:5.0, cake:2.99}
    allow(menu).to receive(:select_food).and_return(order)
    current_order.add('cake', menu)
    expect(current_order.total).to eq(7.99)

  end



  # xit 'can place an order' do
  #
  # end
  #
  # xit 'can alert customer by text'

end
