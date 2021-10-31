require 'order'

describe Order do
  it 'selects food from menu' do
    order = Order.new
    expect(order.current_selected_food).to eq nil
  end
  it 'puts food into ordered food array' do
    order = Order.new
    expect(order.ordered_food).to eq []
  end
end
