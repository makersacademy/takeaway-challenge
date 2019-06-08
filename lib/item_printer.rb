module ItemPrinter

  def self.print(dish, quantity)
       "#{dish.name} x #{quantity} = £#{single_dish_price(dish, quantity)}"
  end

  private

  def self.single_dish_price(dish, quantity)
    dish.price.to_f * quantity
  end
end