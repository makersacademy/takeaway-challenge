require_relative 'menu'
# stores the order by a customer
class Order
  attr_reader :order_list

  def initialize
    @menu = Menu.new
    @selected_item = nil
    @order_list = []
  end

  def select_food(food, quantity = 1)
    find_item(food)
    check_if_available
    get_item_info(quantity)
    store_item(quantity)
  end


  private
  def find_item(food)
    @menu.list.each{ |item| @selected_item = item if item[0] == food }
  end

  def check_if_available
    raise 'Sorry, that item is not available!' if @selected_item == nil
  end

  def get_item_info(quantity)
    @food = @selected_item[0].to_s.gsub('_', ' ')
    @price = @selected_item[1] * quantity
  end

  def store_item(quantity)
    @order_list << "#{ quantity }x #{ @food }: £#{ @price }"
  end
end

order = Order.new
order.select_food(:bean_burger, 2)
order.select_food(:vegan_cheese_platter, 3)
puts order.select_food(:breaded_aubergine, 1)
