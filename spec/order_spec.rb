require 'order'
require_relative '../lib/menu.rb' # need to stub

describe Order do
subject(:order_new){ described_class.new("jim","7","cam","nw10","+555") }
  it "Can create a new Order that takes 5 arguments"\
    "(name,house_no,street,postcode,phone_no)" do
    expect(Order).to respond_to(:new).with(6).arguments
  end

  it "Can add and item and its quantity to the cart" do
    menu = Menu.new
    order = order_new
    order.add_to_cart(menu,menu.itemised[0],2)
    expect(order)
      .to have_attributes(cart: [[["CHICKEN CACCIATORE","£13.95"], 2]] )
  end

  it "Can delete an item and and a particular quantity from the cart" do
    menu = Menu.new
    order = order_new
    order.add_to_cart(menu,menu.itemised[0],2)
    order.del_from_cart(menu.itemised[0],2)
    expect(order).to have_attributes(cart: [] )
  end

  it "Can clear a cart and reset cart total to zero" do
    menu = Menu.new
    order = order_new
    order.add_to_cart(menu,menu.itemised[0],2)
    order.clear_cart
    expect(order).to have_attributes(cart: [], total: 0 )
  end

end
