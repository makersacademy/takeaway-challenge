require './lib/dish'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def print_list
    return "These are our dishes and price: #{list_message}"
  end

  def add_dish(name, price, dish = Dish)
    @list << dish.new(name, price)
  end

  def contain?(dish)
    no_dish_error unless on_manu?(dish)
    return true
  end

  def price?(dish)
    price_search(dish)
  end

  private

  def list_message
    display = []
    @list.each { |dish| display << "Dish Name: #{dish.name}, Price: #{dish.price}" }
    display.join(", ")
  end

  def no_dish_error
    raise "This dish is not on our takeaway menu."
  end

  def on_manu?(dish)
    dish_name = []
    @list.each { |items| dish_name << items.name }
    dish_name.include?(dish)
  end

  def price_search(dish)
    name = []
    price = []
    @list.each { |items| name << items.name & price << items.price }
    price[name.index(dish)]
  end
end
