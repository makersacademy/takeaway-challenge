#understands owning a basket and a telephone number
require_relative "basket"
require_relative "phone"
class Customer
  attr_reader :phone_number, :basket
  def initialize phone_number= Phone::PHONE_NUMBER, basket = Basket.new
    @basket = basket
    @phone_number = phone_number
  end

  def view_basket
    basket.to_s
  end

  def add item
    basket.add item
  end

  def finish_order amount
    basket.finish_order amount, phone_number
  end
end
