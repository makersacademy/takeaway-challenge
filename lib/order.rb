require "./lib/menu"

class Order

  def initialize(menu = Menu.new)
    @pricelist = menu.dishes
    @dishes = []
  end

  def add(dish_name, quantity = 1)
    @dishes << { dish: dish_name, quantity: quantity }
  end

  def total_price
    update_prices
    @total
  end

  private

  def update_prices
    @total = 0
    @dishes.each do |hash| 
      dish_name = hash[:dish]
      quantity = hash[:quantity]
      @total += (price(dish_name) * quantity)
    end
    @total
  end

  def price(dish)
    @pricelist.each do |hash|
      return hash[:price] if hash[:name] == dish
    end
  end

end
