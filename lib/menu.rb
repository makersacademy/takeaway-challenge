require_relative 'dish'

class Menu
  def dishes
    @dishes ||= []
  end

  def dish_prices
    @dish_prices ||= []
  end

  def add dish
    dishes << dish.name
    dish_prices << dish.price
  end

  def remove dish
    dishes.delete(dish.name)
  end

  def view
    result = ""
    dishes.each.with_index(1) do |dish, index|
      result << "#{index}. #{dish}: £#{dish_prices[index - 1]}\n"
    end
    result
  end
end
