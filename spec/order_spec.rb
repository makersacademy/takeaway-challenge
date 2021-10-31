require 'order'

describe Order do
  it 'selects food from menu' do
    order = Order.new
    expect(order.add_food).to include { "Cod £6" }
  end
end