require_relative "menu"
require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :basket

  def initialize (menu = Menu.new, send_message = Message.new)
    @menu = menu
    @basket = []
    @send_message = send_message
  end

  def print_menu
    full_menu.map do |items|
      items.map {|key,value| "#{key}: £#{value}"}
    end.join(",")
  end

  def add_to_basket(item, quantity)
    arr = full_menu.select do |items|
      items[item]
    end
    cost = (arr[0][item]) * quantity
    "#{item} x #{quantity} costs £#{cost}"
    @basket << [item, quantity, cost]
  end

  def confirm_meal
    total_items = @basket.map {|order| "#{order[1]}x #{order[0]}"}.join(",")
    total_cost = @basket.collect {|order| order[2]}.inject(:+)
    "Confirmed order: #{total_items}, Total cost: £#{total_cost}"
    @send_message
  end

  private

  def full_menu
    menu.dishes
  end
end
