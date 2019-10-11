require_relative "dishes"
class Customer

attr_reader :customer_dishes
attr_reader :order_msg

  def initialize
    @customer_dishes = []
    @order_msg = "Thank you! Your order was placed and will be delivered before 18:52"
  end

  def check
    @dishes
  end

  def select(dish)
    @customer_dishes << dish
  end

  def amount_of_dishes
    @customer_dishes.count
  end

#----- I HAVE OUTPUT THE TEXT MESSAGE TO THE TERMINAL -----
  def place_order
    @order_msg
  end

end
