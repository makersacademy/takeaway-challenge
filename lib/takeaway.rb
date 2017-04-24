require_relative 'restaurant'
require_relative 'text_service'

class Takeaway # understands creating an order

  attr_reader :menu, :order

  def initialize
    @order = Hash.new(0)
    @restaurant = Restaurant.new
    @text_service = TextService.new
  end

  def view_menu
    @restaurant.view
  end

  def add_item(item, quantity)
    @order[item.to_sym] += quantity.to_f
    "#{quantity} #{item} added to order."
  end

  def items_total
    menu = (@restaurant.menu).keep_if { |k, v| @order.key? k }
    @total =  @order.merge(menu){|key, oldval, newval| newval * oldval}
  end

  def order_total
   items_total.values.inject(:+)
  end

  def submit_order
    @total.values.inject(:+) == order_total ? @text_service.send_text : raise("There was a problem with your order.")
  end

end
