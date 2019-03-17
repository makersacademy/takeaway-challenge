require 'menu'
require 'order'
require 'order_list'
require 'dish'
require 'message'

feature "An indian takeaway menu", :type => :feature do
  let(:indian_menu) { Menu.new }
  let(:order_items) { OrderList.new }

  before(:each) do
    indian_menu.add(Dish.new(1, "Chicken Korma", 6.95))
    indian_menu.add(Dish.new(2, "Vegetable Masala", 5.95))
    indian_menu.add(Dish.new(3, "Pilau Rice", 2.5))
    indian_menu.add(Dish.new(4, "Garlic Naan", 3))

  end

  # let(:text_message) { Message.new }
  let(:text_message) { double :message }
  let(:todays_order) { Order.new(indian_menu, text_message) }

  it "adds some items to an order and places the order" do
    order_items.add("Chicken Korma", 1)
    order_items.add("Pilau Rice", 1)
    total_cost = 6.95 + 2.5
    allow(text_message).to receive(:send_text) { "Message sent" }
    expect(todays_order.place(order_items, total_cost)).to have_text("order placed")
  end
end
