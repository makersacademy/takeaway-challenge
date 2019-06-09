require 'order'
require 'takeaway'

describe Order do
  it 'stores users selection' do
    order = Order.new
    takeaway = Takeaway.new
    takeaway.choose_order("Burger", 2)
    expect(order.selection).to include :burger => 2
  end

end
