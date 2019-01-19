require 'order'

describe Order do

  before(:each) {
    @ppp_items = [[2, "pizza", 1, "pasta"], 3]
    @ppp_order = Order.new(@ppp_items)
  }

  it 'initializes with list of items' do
    # dbl_plane = double("Plane", flying: 0, airborne: true, grounded: false)
    # dbl_order = double("order", items: [2, "pizza", 1, "pasta"])
    expect(@ppp_order.items).to eq @ppp_items
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order


end
