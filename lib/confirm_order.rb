require_relative 'menu'
require 'pry'

class ConfirmOrder

  def initialize(menu = Menu.new, requested_order)
    @menu = menu.menu_list
    @requested_order = requested_order
    @total = 0
  end

  def order_valid?
    list_of_menu_items = @menu.keys
    list_of_requested_items = @requested_order.keys
    (list_of_requested_items - list_of_menu_items).length == 0 ? true : false
  end

  def raise_error_for_invalid_order
    raise 'Order not valid' unless order_valid?
  end

  def calculate_total
    total = @menu.map { |item, price|
        price * @requested_order[item] if @requested_order.key?(item)
      }.compact.sum.round(2)
  end
end
