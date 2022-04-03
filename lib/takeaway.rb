require 'byebug'
require_relative 'order_confirmation'

class Takeaway

  attr_reader :args, :clients_order

  MENU = {
    "Samosas" => 5,
    "Ice Cream" => 3,
    "Fries" => 5,
    "Celery Juice" => 5, 
    "Apple Pie" => 7, 
    "Pizza" => 15,
    "Coffee" => 4
  }.freeze

  def initialize 
    @clients_order = []
  end

  def view_menu
    MENU.map { |dish, price| "#{dish} - £#{price}"}.join(', ')
  end

  def select_dish(item)
    fail "That item is not on the menu" unless MENU.has_key?(item)
    "#{item} has been added to your basket"
    @clients_order << item
  end

  def order_with_prices
    receipt = @clients_order.map { |i| "#{i} - £" + MENU[i].to_s }.join(", ")
    receipt
  end

  def delete_item(item)
    @clients_order.delete(item)
  end

  def check_order
    order_total = @clients_order.flatten.map { |value| MENU.fetch(value) }
    "Your selected items are #{order_with_prices}, and the total is £#{order_total.sum}"
  end
  
  def place_order
    puts "Your order has been placed successfully. You will receive a text confirmation shortly."
    OrderConfirmation.new.send_text_message
  end
end
