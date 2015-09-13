require 'order'


describe 'Order' do

  @food = {'fish':5.0,
           'cake':2.99,
           'beef':7.0}
  @fish = {:fish => 5.0}

  it 'can form an order from selected menu items' do
    order = {:fish => 5.0}
    menu = double(:menu, menu: @food, select_food: order)
    current_order=Order.new
    expect(current_order.add('fish', menu)).to eq order
  end

  it 'can form an order from 2 selected menu items' do
    order = {:fish => 5.0, :cake => 2.99}
    menu = double(:menu, menu: @food, select_food: order)
    current_order=Order.new
    current_order.add('cake', menu)
    expect(current_order.add('fish', menu)).to eq order
  end


  # xit 'can place an order' do
  #
  # end
  #
  # xit 'can alert customer by text'

end
