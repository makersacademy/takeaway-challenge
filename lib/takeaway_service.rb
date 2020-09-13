require_relative 'restaurant'
require_relative 'menu'
require_relative 'dish'
require_relative 'order'

class TakeawayService
  attr_reader :restaurant, :orders, :order_counter

  def initialize(restaurant)
    @restaurant = restaurant
    @orders = []
    @order_counter = 1
  end

  def print_menu
    puts @restaurant.format_menu
  end

  def create_order(order = Order.new(@restaurant, @order_counter))
    @orders << order
    increment_order_counter
    "Your order ID is #{order.id}"
  end

  def add_to_order(order_id, dish_name, qty)
    order = find_order(order_id)
    order.add(dish_name, qty)
  end

  private

  def increment_order_counter
    @order_counter += 1
  end

  def find_order(id)
    @orders.find do |order|
      id == order.id
    end
  end
end

@takeaway = TakeawayService.new(
  Restaurant.new(
    Menu.new(
      Dish.new('Tom yum soup', 4.50),
      Dish.new('Pad thai', 8.95),
      Dish.new('Pad see yew', 8.95),
      Dish.new('Egg fried rice', 3.89),
    )
  )
)
