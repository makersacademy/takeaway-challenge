require_relative "menu"
require_relative "message"
require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :basket, :send_message

  def initialize (menu = Menu.new, send_message = Message.new)
    @menu = menu
    @send_message = send_message
    @basket = []
  end

  def print_menu
    full_menu.map { |items| items.map { |key,value| "#{key}: £#{value}" }}.join(",")
  end

  def add_to_basket(item, quantity)
    arr = full_menu.select { |items| items[item] }
    cost = (arr[0][item]) * quantity
    print "#{item} x #{quantity} costs £#{cost}"
    @basket << [item, quantity, cost]
  end

  def confirm_meal
    total_items = @basket.map { |order| "#{order[1]}x #{order[0]}" }.join(",")
    total_cost = @basket.collect { |order| order[2] }.inject(:+)
    send_message.txt_confirmation
    return "Confirmed order: #{total_items}, Total cost: £#{total_cost}"
  end

  def clear_basket
    @basket =[]
  end

  private

  def full_menu
    menu.dishes
  end
end
