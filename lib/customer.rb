require 'restaurant'

class Customer
  attr_reader :order, :total

  def initialize
    @order= []
    @total = 0
  end

  def customer_order(user_meal_input, user_amount_input)
    p "What meal would you like: "
    p '----------------------'
    p "How many of those would you like?: "
    p '-----------------------'
    @order << { :order_meal => user_meal_input,
      :order_amount => user_amount_input }
  end

end
