require 'menu'

class Order

  def initialize
    @current_order = { food: nil , quantity: nil , price: nil}
    @basket = []
  end

  def update_order
    @current_order[:food] = @option
    @current_order[:quantity] = @quantity
    @current_order[:price] = @price * @quantity
    @current_order
  end


  def empty_basket
     @basket = []
  end

  def option(option)
    @option = option
  end

  def food_quantity(quantity)
    @quantity = quantity
  end

  def price(price)
    @price = price
  end

end
