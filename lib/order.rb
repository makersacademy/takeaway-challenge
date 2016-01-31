require_relative 'menu'

class Order

attr_reader :user_input, :current_order, :meal_quantities, :meal_selection

  def initialize(user_input, menu_choice)
    @user_input = user_input
    @current_order = current_order
    @menu_choice = menu_choice
    @bill = 0
  end



  def process_order
    @meal_quantities = user_input.gsub(/^0-9/, " ").split(" ").map!{|number| number.to_i}
    @meal_selection = user_input.gsub(/\W/," ").split(" ").map!{|word| word.capitalize.to_sym}.keep_if{|meal| menu_choice.dishes.has_key?}
    @current_order = meal_selection.keep_if do |meal|
      @menu_choice.has_key?
    end
    current_order.zip(quantity)
  end

end
