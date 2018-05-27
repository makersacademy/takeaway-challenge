require_relative 'menu'
require 'pry'

class ConfirmOrder

  def initialize(menu, requested_order)
    @menu = menu
    @requested_order = requested_order
  end

  def order_checked?
    list_of_menu_items = @menu.menu_list.keys
    list_of_requested_items = @requested_order.keys
    (list_of_requested_items - list_of_menu_items).length == 0 ? true : false
  end
end
