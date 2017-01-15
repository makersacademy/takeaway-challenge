#understands owning a basket and a telephone number
require_relative "basket"
class Customer
  attr_reader :phone_number, :basket
  def initialize phone_number, basket = Basket.new
    @basket = basket
    @phone_number = phone_number
  end

  def add item
    basket.add item
  end

  def finish_order amount
    basket.finish_order amount, phone_number
  end
end
