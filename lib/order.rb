require_relative 'menu'

class Order

attr_reader :user_input, :menu_choice, :meal_quantities, :meal_selection, :current_order

  def initialize(user_input, menu_choice)
    @user_input = user_input
    @current_order = current_order
    @menu_choice = menu_choice
    @bill = 0
  end


  def process_order
    @meal_quantities = user_input.gsub(/\w^0-9/," ").split(" ").map!{|number| number.to_i}
    puts meal_quantities
    @meal_selection = user_input.gsub(/\W/," ").split(" ").map!{|word| word.capitalize.to_sym}.keep_if{|meal| menu_choice.has_key? meal}
    meal_selection.zip(meal_quantities)
  end

end
