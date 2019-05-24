require 'menu'
class Order
  attr_reader :ordered_items, :total, :menu_dishes
  def initialize 
    menu = Menu.new
    @menu_dishes = menu.menu_dishes
    @ordered_items = []
    @total = 0
  end

  def select_dishes(item_chosen, quantity)
    @ordered_items.push(item_chosen)
    @total += (@menu_dishes[item_chosen] * quantity)
  end

  def price
    @total
  end

  def place_order
    raise "Order incomplete" if total == 0 || @ordered_items.empty?
    !@ordered_items.empty? && @total > 0
    return "Thank you! Your order was placed and will be delivered before 18:52"
  end
end