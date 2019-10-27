class Order
  attr_reader :basket, :menu
  def initialize(menu)
    @basket = []
    @menu = menu
    @total = 0
  end

  def add(dish)
    fail "This dish does not exist on the menu" unless @menu.available?(dish)

    dish_to_add = @menu.dishes.select { |key| dish == key }
    @basket << dish_to_add
  end

  def remove(dish)
    dish_to_remove = @menu.dishes.select { |key| dish == key }
    @basket.delete(dish_to_remove)
  end

  def calculate_total
    @basket.each {|item|
      item.each { |key, value|
        @total += value
      }
    }    
    return @total
  end

end
