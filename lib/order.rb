require_relative "menu"

class Order
  attr_reader :main_menu, :selected_meals
  
  def initialize
    @main_menu = Menu.new.main_menu
    @selected_meals = nil
  end

  def see_menu
    @main_menu.each_with_index { |meal, i| meal.each { |k, v| puts "#{i + 1}. #{k}, #{v}" } }
  end

  def select_meal(array)
    @selected_meals = @main_menu.select.with_index { |_, i| array.include?(i + 1) }
  end
end
