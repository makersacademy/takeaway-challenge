require 'order'


describe 'Order' do

  food =  {'fish':[5.0, 0],
           'cake':[2.99, 0],
           'beef':[7.0, 0]}
  let(:current_order){Order.new}
  let(:menu){ double('menu', menu: food) }

  it 'can form an order from selected menu items' do
    allow(menu).to receive(:select_food).and_return( fish:[5.0,0] )
    expect(current_order.add('fish', 1 , menu)).to eq(fish: [5.0,1])
  end

  it 'can form an order from 2 selected menu items' do
    order = {cake:[2.99,1], fish:[5.0,1]}
    allow(menu).to receive(:select_food).and_return( cake:[2.99,0] )
    current_order.add('cake', 1, menu)
    allow(menu).to receive(:select_food).and_return( fish:[5.0,0] )
    expect(current_order.add('fish', 1, menu)).to eq order
  end

  it 'returns the total price of the order' do
    allow(menu).to receive(:select_food).and_return( cake:[2.99,0] )
    current_order.add('cake',1, menu)
    allow(menu).to receive(:select_food).and_return( fish:[5,0] )
    current_order.add('fish', 2, menu)
    allow(menu).to receive(:select_food).and_return( beef:[7.0,0] )
    current_order.add('beef', 1, menu)
    expect(current_order.total).to eq(19.99)

  end

end
