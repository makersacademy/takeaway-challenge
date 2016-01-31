require_relative 'basket'

private

class Order

attr_reader :user_input, :menu_choice, :basket, :basket_klass

  def initialize(user_input, menu_choice, basket_klass=Basket)
    @user_input = user_input
    @menu_choice = menu_choice
    @basket_klass = basket_klass
    @basket = basket_klass
  end

  def add_to_basket
    selection = []
    submission.each{|dish_quantity| selection << dish_quantity}
    unless basket.is_a? basket_klass
      @basket = basket.new(selection, menu_choice)
    else
      (@basket.selection << selection).flatten
    end
  end

  def process_order_dishes
    user_input.gsub(/\W/," ").split(" ").map!{|word| word.capitalize.to_sym}.keep_if{|meal| menu_choice.has_key? meal}
  end

  def process_order_quantities
    user_input.gsub(" a ", "1").gsub(/\D/,"").split("").map!{|number| number.to_i}
  end

  def submission
    process_order_dishes.zip(process_order_quantities)
  end



end
