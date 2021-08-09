require_relative "menu"
require_relative "sms"

class Order
  attr_reader :main_menu, :number, :selected_meals
  
  def initialize(number, menu = Menu.new)
    @number = number
    @main_menu = menu.main_menu
    @selected_meals = nil
    @order_total = 0
  end

  def see_menu
    @main_menu.each_with_index do 
      |meal, i| meal.each { |k, v| puts "#{i + 1}. #{k}, £#{v}" }
    end
  end

  def select_meals(array)
    @selected_meals = @main_menu.select.with_index { |_, i| array.include?(i + 1) }
    @selected_meals.each { |meal| meal.each { |k, v| puts "#{k}, £#{v}" } }
  end

  def check_total
    @selected_meals.each { |meal| meal.each { |_, v| @order_total += v } }
    puts "Order total = £#{@order_total}"
  end

  def check_out
    SMS.send(@number)
  end
end
