require 'menu'

class Order

  attr_reader :current_order, :basket, :balance

  def initialize
    @current_order = { food: nil , quantity: nil , price: nil}
    @basket = []
    @check_basket = nil
    @balance = 0
    @amount = 0
  end

def update_order
  @balance += (@price * @quantity)
  @current_order[:food] = @option
  @current_order[:quantity] = @quantity
  @current_order[:price] = (@price * @quantity)
end

def update_basket
  puts "#{@quantity}x #{@option}"
  @basket << @current_order
  @current_order = { food: nil , quantity: nil , price: nil}
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

def total_price
  @basket.collect { |x| x[:price] }.inject(&:+)
end

end
