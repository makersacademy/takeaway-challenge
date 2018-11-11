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
    @menu.each { |k, v| @order_list[k] = v * quantity if item == k }
    return "Item not in menu" unless @menu[item]
    "Item: #{item}, Quantity: #{quantity}, has been added to your order"
  end

  def change_item_quantity(item, quantity)
    @order_list.each do |product, total|
      return "#{item} not in order list" unless @order_list[item]
      @menu.each { |k, v| @order_list[product] = v * quantity if item == product }
    end
    "You've changed your order to Item: #{item}, Quantity: #{quantity}"
  end

  def delete_item(item)
    @order_list.each do |product, total|
      return "Item not in order list" unless @order_list[item]
      @menu.each { |k, v| @order_list.delete(product) if item == product }
    end
    "Item: #{item} has been deleted from your order"
  end

  def bill_total
    @order_list.map { |k, v| v }.reduce(:+)
  end

  def check_order_summary
    @order_list.map { |v| v }.reduce(:+)
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
