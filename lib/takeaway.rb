require_relative 'dish.rb'
require_relative 'text.rb'
require 'twilio-ruby'

class Takeaway 
  attr_reader :menu, :final_order, :texter
  def initialize
    @texter = Text.new
    @menu = {
      "dish 1" => 5,
      "dish 2" => 7,
      "dish 3" => 9}
    @final_order = []
  end

  def menu
    @menu.each do |dish, price|
      puts "#{dish} -- £#{price}"
    end
  end

  def add_dish(name, price)
    dish = Dish.new(name, price)
    @menu[dish.name] = dish.price
  end

  def selected_dishes(*order)
    order.each do |order|
      @final_order << order
    end
    return @final_order
  end

  def final_sum
    total = 0
    @final_order.each do |dish|
      total += @menu[dish]
    end
    return total
  end

  def check_order
    receipt = {}
    @final_order.each do |dish|
      receipt[dish] = @menu[dish]
    end
    return [receipt, final_sum] 
  end

  def text
    @texter.send_text
  end

  def place_order
    puts check_order
    text
  end
end