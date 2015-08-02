#require_relative 'List'

class User

  attr_accessor :food_menu, :food_order
  attr_reader :phone

  def initialize user_phone
    @phone = user_phone
  end

  def show_menu
    @food_menu = List.new
    food_menu.load_predefined_dishes
  end

  def select_food_to_order *dishes
    dishes.each { |dish| food_menu.select_food_order dish }
    food_menu.food_order#food_menu.select_food_order dishes
  end

end