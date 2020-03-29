require 'order'

describe Order do

  let(:menu_double) { double :Menu, list: { :fish => 5, :chips => 3, :salad => 2 } }

  it 'returns the menu on #menu' do
    order = Order.new(menu_double)
    expect(order.menu).to include(
      :fish => 5,
      :chips => 3,
      :salad => 2
    )
  end

  it 'allows the user to #add to their order' do
    order = Order.new(menu_double)
    expect(order.update("1 fish, 3 salad, 2 chips")).to inlcude(:fish=>1, :salad=>3, :chips=>2)
  end

end
