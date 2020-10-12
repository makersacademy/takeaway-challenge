require 'order'

describe Order do
  let(:menu_double) { double :Menu, list: { :shawarma => "£5", :chips => "£3", :salad => "£2", :pepsi => "£1" } }
  
  it 'returns the menu on #menu' do
    order = Order.new(menu_double)
    expect(order.menu).to include(
      :shawarma => "£5",
      :chips => "£3",
      :salad => "£2",
      :pepsi => "£1"
    )
  end

  it 'allows the user to #add to their order' do
    order = Order.new(menu_double)
    expect(order.update("1 shawarma, 3 salad, 2 chips, 1 pepsi")).to include(:shawarma => 1, :salad => 3, :chips => 2, :pepsi => 1)
  end

  it '#cost returns total order cost' do
    order = Order.new(menu_double)
    order.update("1 shawarma, 3 salad, 2 chips, 1 pepsi")
    expect(order.cost).to eq 18
  end

  it 'allows user to confirm order' do
    order = Order.new(menu_double)
    order.update("1 shawarma, 3 salad, 2 chips, 1 pepsi")
    expect(order.confirm).to include("Thank you! Your order was placed and will be delivered before #{Time.new + Order::DELIVERY_TIME}")
  end

end