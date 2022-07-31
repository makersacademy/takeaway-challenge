require_relative 'menu'
require_relative 'order'
require_relative 'text'
require 'time'

class Takeaway

  attr_reader :order, :total

  def initialize(menu = Menu.new, order = Order.new, text = Text.new)
    @menu = menu.parse_file
    @order = order
    @total = 0
    @text = text
  end

  def order_food(item_number, quantity)
    item_number -= 1
    @order.select(item_number, @menu, quantity)
    @total += @order.pad[-1][:cost] * quantity
  end

  def remove_food(item_number, quantity)
    item_number -= 1
    @total -= @menu[item_number][:cost] * quantity
    @order.remove(@menu[item_number][:name], quantity)
  end

  def display_menu
    @menu.each_with_index { |item, index| puts "#{index + 1}. #{item[:name]} - £#{item[:cost]}" }
  end

  def display_order
    @order.pad.each do |item|
      puts "#{item[:amount]} x #{item[:name]} - £#{item[:cost] * item[:amount]}"
    end    
    puts "Total cost: £#{@total}"
  end

  def order_correct?
    @total == @order.total
  end

  def complete_order
    @order.delete_empty_items

    raise 'Your order is empty!' if @order.pad.empty?

    @order.clear_pad
    confirmation_text
  end

  private

  def confirmation_text
    @text.send_text(confirmation_message)
  end

  def delivery_time
    (Time.now + 1 * 60 * 60).strftime("%I:%M %p")
  end

  def confirmation_message
    "Thanks for your order! Your food will be with you at #{delivery_time}."
  end
end
