require 'menu'

class Order

  def initialize
    @current_order = { food: nil , quantity: nil , price: nil}
    @basket = []
    @balance = 0
  end

  def update_order
    @current_order[:food] = @option
    @current_order[:quantity] = @quantity
    @current_order[:price] = (@price * @quantity)
    @balance += (@price * @quantity)
  end

  def update_basket
    puts "Total Order:\n#{@quantity}x #{@option}"
    @basket << @current_order
  end

  def balance
    @balance
  end

  def checkout(money)
    if money < @balance
      p "Sorry, wrong amount for payment"
    elsif money > @balance
      change = money - @balance
      p "Thanks! Here is $#{change} change"
    else
      p "Thank you! Delivery is on its way"
    end
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
