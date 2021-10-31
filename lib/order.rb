require_relative 'menu'
require_relative 'text_message'

class Order
  attr_reader :ordered_items, :menu, :total, :text_message

  def initialize
    @ordered_items = []
    @menu = Menu.new
    @total = 0
    @text_message = TextMessage.new
  end

  def add_dish(dish_name, quantity = 1)
    dish_name = menu.dishes.select { |dish| dish[:name] == dish_name }.reduce(&:merge)
    quantity.times { @ordered_items << dish_name }
  end

  def display_order
    @ordered_items.each { |dish| puts "#{dish[:name]} £#{dish[:price]}"}.reduce(&:merge)
  end

  def total_cost
    @ordered_items.each { |dish| @total += dish[:price] }
    "Total cost £#{@total}"
  end
 
  def send_text
    @text_message.send_message(total_cost)
  end
end