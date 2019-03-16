require 'menu'
require 'order'
require 'order_list'
require 'dish'

feature "An indian takeaway menu", :type => :feature do
  let(:indian_menu) { Menu.new }
  let(:order_items) { OrderList.new }

  before(:each) do
    indian_menu.add(Dish.new(1, "Chicken Korma", 6.95))
    indian_menu.add(Dish.new(2, "Vegetable Masala", 5.95))
    indian_menu.add(Dish.new(3, "Pilau Rice", 2.5))
    indian_menu.add(Dish.new(4, "Garlic Naan", 3))

  end

  let(:todays_order) { Order.new(indian_menu) }

  it "adds some items to an order and places the order" do
    order_items.add("Chicken Korma", 1)
    order_items.add("Pilau Rice", 1)
    total_cost = 6.95 + 2.5
    expect(todays_order.place(order_items, total_cost)).to have_text("order placed")
  end
end
