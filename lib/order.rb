require_relative 'dishes'
require_relative 'text'

class Order
  attr_reader :basket, :menu, :dishes, :complete, :text

  def initialize
    @basket = Array.new(0)
    dishes = Dishes.new
    @menu = dishes.menu
    @dishes = dishes
    @complete = false
    @text = Text.new
  end

  def select_dishes(index)
    raise "Order already confirmed and can't be changed." if @complete
    raise "Dish is not available. Please choose a different dish." if !dishes.dish_available?(index - 1)
    @basket << @menu[index - 1]
  end

  def delete_dishes(index)
    raise "Order already confirmed and can't be changed." if @complete
    @basket.delete(@menu[index - 1])
    @basket
  end

  def check_total
    total = 0
    @basket.each { |meal| total += meal[:price] }
    return "£#{total}"
  end

  def confirm_order
    @complete = true
    puts "Order complete."
  
    return check_total
  end
end
