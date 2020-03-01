require_relative 'menu'

class Basket

  attr_reader :subtotal

  def initialize
    @basket = []
    @subtotal = 0
  end

  def update(dish, quantity)
    @basket << { name: dish, quantity: quantity }
  end

  def update_subtotal(dish, quantity)
    @subtotal += price_times_quantity(dish, quantity)
  end

  def print
    puts formatted_basket
    @subtotal
  end

  private

  def dish_price(dish)
    Menu::ITEMS[dish][:price]
  end

  def price_times_quantity(dish, quantity)
    dish_price(dish) * quantity
  end

  def formatted_basket
    basket = @basket.map do |dish|
      quantity = dish[:quantity]
      dish_name = dish[:name]
      dish_price = dish_price(dish_name)
      total = price_times_quantity(dish_name, dish[:quantity])

      "#{quantity} x #{dish_name} @ #{dish_price}: #{total}\n"
    end
    basket.join(" ")
  end

end
