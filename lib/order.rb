require_relative 'menu'

class Order
  include Menu
  attr_reader :menu, :order_list, :confirmed

  def initialize

    @menu = MENU
    @order_list = Hash.new
    @confirmed = false

  end

  def check_menu

    @menu

  end

  def add_item(item, quantity = 1)

    @menu.each {|k, v| @order_list[k] = v * quantity if item == k}
    return "Item: #{item}, Quantity: #{quantity}, has been added to your order" if @order_list[item]
    return "Item not in menu" if !@order_list[item]

  end

  def bill_total

    @order_list.map {|k, v| v}.reduce(:+)

  end

  def check_order_summary

    @order_list.map {|v| v}.reduce(:+)

  end

  def confirmation_text

    "Thank you! Your order was placed and will be delivered in about 30 minutes"

  end

  def place_order
    @confirmed ? confirmation_text : "You didn't confirm your order"
  end

  def confirm_order
    @confirmed = true
  end

end
