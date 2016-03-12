require_relative 'order'

class TakeAway
  attr_reader :menu, :selection, :order_class, :current_order

  NOT_IN_MENU = "Item not in menu"
  DEFAULT_QUANTITY = 1

  def initialize(order_class)
    @menu = {"fish and chips" => 4.34,
             "chicken korma" => 3.56,
             "sausges and mash" => 5.46,
             "cheeze pizza" => 2.87,
             "pepperoni pizza" => 3.93}
    @order_class = order_class
    @current_order = nil
  end

  def list_menu
    @menu.dup
  end

  def order(item, quantity=DEFAULT_QUANTITY)
    @current_order = @order_class.new
    raise NOT_IN_MENU unless include_item?(item)
    select_item(item)
    @current_order.add_to_basket(@selection, quantity)
  end

  private

  def include_item?(item)
    menu.include? item
  end

  def select_item(item)
    @selection = menu.select{|k,v| k == item}
  end

end
