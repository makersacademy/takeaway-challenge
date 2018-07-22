# Holds order summary
# Caluculates order summary
# Sends text messaage
class Order
  attr_reader :summary

  def initialize
    @summary = []
  end

  def add(dish, quantity)
    @summary << {dish_name: dish, quantity: quantity}
  end 
end 