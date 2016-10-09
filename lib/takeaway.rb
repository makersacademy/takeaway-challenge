require "csv"
require_relative 'dish_list'
require_relative 'dish'
require_relative 'order'
require "twilio-ruby"
require "envyable"

class Takeaway

  attr_reader :dish_list, :order

  def initialize( args = {dish_list: DishList.new(Dish), order: Order.new} )
    @dish_list     = args[:dish_list]
    @order         = args[:order]
    @placed_orders = []
  end

  def load_dishes(filename)
    if File.exist?(filename)
      CSV.foreach(filename) { |data| dish_list.add_dish(data) }
    else
      fail "File '#{filename}' not found!"
    end
  end

  def menu
    puts dish_list
  end

  def add_dish(id, qty=1)
    fail_if_wrong_id(id)
    fail_if_wrong_qty(qty)
    dish = dish_list.select_dish(id)
    order.add_item(dish, qty)
  end

  def remove_dish(id, qty=1)
    fail_if_wrong_id(id)
    fail_if_wrong_qty(qty)
    dish = dish_list.select_dish(id)
    order.remove_item(dish, qty)
  end

  def order_total
    order.total
  end

  def place_order
    fail "You haven't added any items to your order" if order.items.empty?
    @placed_orders << order
    send_confirmation_SMS
    @order = Order.new
    "Order placed successfully!"
  end

  def placed_orders
    @placed_orders.dup
  end

  private

  def send_confirmation_SMS
    Envyable.load('./config/env.yml', 'development')
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    client = Twilio::REST::Client.new account_sid, auth_token

    params = {:body => confirmation_text, :to => "+447751703401", :from => "+441143032291"}
    client.account.messages.create(params)
  end

  def confirmation_text
    delivery_time = "#{Time.now.hour+1}:#{Time.now.min}"
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

  def fail_if_wrong_id(id)
    max = dish_list.dishes.count
    fail "Wrong ID! Please, select dishes from 1 to #{max}" unless (1..max).include?(id)
  end

  def fail_if_wrong_qty(qty)
    fail "Wrong quantity! Quantity should be 1 or more" if qty < 1
  end
end
