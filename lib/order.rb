require_relative 'restaurant'
require 'twilio-ruby'
require_relative 'sms_text'
require_relative 'menu'

class Order
  include Menu
  attr_reader :order_list, :confirmed, :menu

  def initialize(restaurant)
    @restaurant = restaurant
    @menu = @restaurant.menu
    @order_list = Hash.new
    @confirmed = false
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
    return "Item not in order list" unless @order_list[item]
    @order_list.delete(item)
    "Item: #{item} has been deleted from your order"
  end

  def bill_total
    @order_list.map { |k, v| v }.reduce(:+)
  end

  def check_order_summary
    @order_list.map { |v| v }.reduce(:+)
  end

  def confirmation_text(sms_text = SMSText.new)
    # sms_text.send_sms/ my twilio account has expired
    "Thank you! Your order has been placed you will receive a sms shortly"
  end

  def place_order
    @confirmed ? confirmation_text : "You didn't confirm your order"
  end

  def confirm_order
    @confirmed = true
  end

end
