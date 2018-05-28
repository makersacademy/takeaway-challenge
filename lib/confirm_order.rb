require_relative 'menu'
require 'pry'

class ConfirmOrder

  attr_reader :expected_total

  def initialize(menu = Menu.new, requested_order, expected_total)
    @menu = menu.menu_list
    @requested_order = requested_order
    @expected_total = expected_total
    @actual_total = 0
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
    @actual_total = @menu.map { |item, price|
        price * @requested_order[item] if @requested_order.key?(item)
      }.compact.sum.round(2)
    raise 'Incorrect total' if @expected_total != @actual_total
    return @actual_total
  end
end
