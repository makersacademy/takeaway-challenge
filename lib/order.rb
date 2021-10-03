class Order
  MENU = { dish1: 10, dish2: 14, dish3: 9 }
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def choose_dish(dish_name)
    @dish_name = dish_name
    store_dish(@dish_name)
  end

  def calculate_price
    total = 0
    @current_order.each do |item|
      total += MENU[item]
    end
    total
  end

  private

  def store_dish(new_dish)
    @current_order << new_dish
  end
end
