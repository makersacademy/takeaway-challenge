require 'dish'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_to_menu(name, price)
    @dishes << Dish.new(name, price)
  end

  def compile_menu
    list = format_dishes(@dishes)
    list.join
  end

  def compile_order(order)
    list = format_dishes(order)
    total = calculate_total(order)
    list << "Total: #{total}\n"
    list.join
  end

  private

  def format_dishes(dishes)
    dishes.map do |dish|
      "#{dish.name}: #{dish.price}\n"
    end
  end

  def calculate_total(dishes)
    prices = dishes.map do |dish|
      dish.price.to_i
    end
    prices.sum
  end
end
