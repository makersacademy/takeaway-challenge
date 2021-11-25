require_relative 'dish.rb'

class Takeaway 
  attr_reader :menu, :final_order
  def initialize
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
end