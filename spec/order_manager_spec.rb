require 'order_manager'

describe OrderManager do

  it "selects a dish from the menu" do
    order = OrderManager.new
    expect(order.select('pad thai')).to eq('Pad thai £6.95')
  end

end
