class Restaurant

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def submit_order(customer_name, customer_phone_number, dishes)
    Order.new(customer_name, customer_phone_number, dishes)
  end


end