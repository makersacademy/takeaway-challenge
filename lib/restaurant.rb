class Restaurant

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def submit_order(customer_name, customer_phone_number,
    order_dishes, expected_sum)
    order_dishes.each_key do |dish|
      fail "Dish not on menu" unless @menu.dishes.include? dish
    end
    order = Order.new(customer_name, customer_phone_number, order_dishes)
    fail "Sum is incorrect" unless order.total_amount == expected_sum
    order
  end



end