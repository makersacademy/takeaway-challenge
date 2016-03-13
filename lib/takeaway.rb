require_relative 'order'
require_relative 'checkout'

class TakeAway
  attr_reader :menu, :selection, :order_class, :current_order

  NOT_IN_MENU = "Item not in menu"
  DEFAULT_QUANTITY = 1
  INCORRECT_PAYMENT = "Incorrect payment amount"

  def initialize(order_class)
    @menu = {"fish and chips" => 4.34,
             "chicken korma" => 3.56,
             "sausges and mash" => 5.46,
             "cheese pizza" => 2.87,
             "pepperoni pizza" => 3.93}
    @order_class = order_class
    @current_order = nil
    @selection = {}
  end

  def list_menu
    @menu.dup
  end

  def order(item, quantity=DEFAULT_QUANTITY)
    in_order
    raise NOT_IN_MENU unless include_item?(item)
    select_item(item, quantity)
    @current_order.add_to_basket(@selection)
    reset_selection
  end

  def checkout(payment)
    raise INCORRECT_PAYMENT if incorrect_amount?(payment)
  end

  private

  def include_item?(item)
    menu.include? item
  end

  def select_item(item, quantity)
    @selection[item] = quantity
  end

  def in_order
    @current_order ||= @order_class.new
  end

  def reset_selection
    @selection.clear
  end

  def incorrect_amount?(payment)
    payment != @current_order.total
  end

end
