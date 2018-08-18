require 'orders'

describe Orders do

  let(:order) { Orders.new }

  it "shows menu with prices" do
    expect(order.view_menu).not_to eq(nil)
  end

end
