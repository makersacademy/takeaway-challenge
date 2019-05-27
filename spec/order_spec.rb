require 'order'

describe Order do

  subject(:order)       { Order.new(menu) }
  let(:menu)            { double(:menu, :dishes => { "Tom Yum" => 9.90, "Pad Thai" => 10.00, "Green Curry" => 6.00, "Red Curry" => 6.00, "Aloe Drink" => 2.00, "Chocolate Ice Cream" => 4.00, "California Roll" => 12.00 }) }

  it 'can show a new order' do
    expect(order.status).to eq("STARTED")
  end

  it 'can show an empty basket' do
    expect(order.basket).to eq({})
  end

  it 'can add a dish and quantity to the basket' do
    order.add_to_basket("Tom Yum", 2)
    expect(order.basket).to eq({ "Tom Yum" => 19.80 })
  end

  it 'can remove dishes from the basket' do
    order.add_to_basket("Tom Yum", 2)
    order.remove_from_basket("Tom Yum")
    expect(order.basket).to eq({})
  end

  it 'can display the total in the basket' do
    order.add_to_basket("Tom Yum", 2)
    order.add_to_basket("Pad Thai", 1)
    order.add_to_basket("California Roll", 1)
    expect(order.total).to eq(41.80)
  end

  it 'can submit the order' do
    order.add_to_basket("Tom Yum", 2)
    order.add_to_basket("Pad Thai", 1)
    order.add_to_basket("California Roll", 1)
    order.place
    expect(order.status).to eq("ORDER PLACED")
  end

end
