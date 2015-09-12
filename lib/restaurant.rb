class Restaurant

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def submit_order(customer_name, customer_phone_number, order_dishes)
    order_dishes.each do
      |dish| fail "Dish not on menu" if !@menu.dishes.include? dish
    end
    Order.new(customer_name, customer_phone_number, order_dishes)
  end


end