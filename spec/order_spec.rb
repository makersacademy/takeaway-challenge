require 'order'

describe Order do

  subject(:order) { Order.new }
  subject(:menu) { Menu.new }

  it 'can show an empty basked' do
    expect(order.basket).to eq({})
  end

  it 'can display a new menu' do
    expect(order.menu).to eq({"Tom Yum" => 9.95, "Pad Thai" => 10.00, "California Roll" => 12.00, "Red Curry" => 6.00, "Green Curry" => 6.00, "Summer Pudding" => 4.00, "Margarita" => 8.00})
  end

  it 'can add a dish and quanity to the basket' do
    order.add("Tom Yum",2)
    expect(order.basket).to eq({"Tom Yum" => 19.90})
  end

  it 'can remove dishes from the basket' do
    order.add("Tom Yum",2)
    order.remove("Tom Yum")
    expect(order.basket).to eq({})
  end

  it 'can display the total in the basket' do
    order.add("Tom Yum",2)
    order.add("Pad Thai",1)
    order.add("California Roll",1)
    expect(order.total).to eq(41.90)
  end

end
