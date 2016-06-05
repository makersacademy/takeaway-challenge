require './lib/dishes'
require './lib/menu'
require './lib/send_sms'

class Order

  attr_reader :cust_name, :cust_number, :menu_object, :order

include Twilio

  def initialize(cust_name, cust_number, menu_object)
    @cust_name = cust_name
    @cust_number = cust_number
    @menu_object = menu_object
    @order = {}
  end

  def add_to_order(item_name, qty)
    fail 'item not on the menu' if find_item(item_name) == []
    @order[find_item(item_name)] = qty
  end

  def confirmation
    @order.each do |item, qty|
      puts "Item: #{item.name}. Price: #{item.price}. Qty: #{qty}"
    end
    puts "Total Number of Items: #{num_items}"
    puts "Total Cost: #{total_cost}"
  end

  def send_text
    send_sms("Thank you for your order was placed at #{Time.new}, your order will be delievered at approx #{Time.new + 1}")
  end

  private

  def find_item(item_name)
    @menu_object.menu.select { |i| i.name == item_name }[0]
  end

  def total_cost
    @total_cost = @order.inject(0) { |sum, (item, qty)| sum + item.price * qty }
  end

  def num_items
    @total_items = @order.inject(0) { |sum, (_, qty)| sum + qty }
  end

end
