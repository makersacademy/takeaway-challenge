class Customer
  attr_reader :customer_order_array

  def initialize
    @customer_order_array = []
  end

  def customer_order
    p "What meal would you like: "
    user_meal_input = gets.chomp
    p '----------------------'
    p "How many of those would you like?: "
    user_amount_input = gets.chomp
    p '-----------------------'
    @customer_order_array << { :customer_meal => user_meal_input,
      :amount_ordered => user_amount_input }
  end
end
