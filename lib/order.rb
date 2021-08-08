require_relative "menu"

class Order
  attr_reader :main_menu
  def initialize
    @main_menu = Menu.new.main_menu
  end

  def see_menu
    puts "----------"
    @main_menu.each_with_index { |meal, i| meal.each { |k, v| puts "#{i + 1}. #{k}, #{v}" } }
    puts "----------"
  end

  # def select_meal
  # end
end
