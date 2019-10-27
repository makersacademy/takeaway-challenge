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
    current_total = 0
    @basket.each { |item|
      item.each { |_key, value|
        current_total += value
      }
    }   
    @total = current_total.round(2) 
    return @total
  end

  def show_basket
    print_string = ""
    @basket.each { |item|
      item.each { |key, value|
        print_string += "#{key}: #{value}\n"
      }
    }
    print print_string.strip
  end

  def show_total
    calculate_total
    print "Your order total is £#{@total}"
  end

end
