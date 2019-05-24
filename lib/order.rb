require './lib/dish.rb'

class Order
  attr_reader :menu, :basket, :dish
  ERROR_MSG = "Could not place order, payment does not meet total!"
  MENU = [
    { dish: "Jasmine Rice", price: 2.50 },
    { dish: "Coconut Rice", price: 3.50 },
    { dish: "Egg Noodles", price: 4.75 },
    { dish: "Egg Fried Rice", price: 3.50 },
    { dish: "Chicken Red Thai Curry", price: 4.75 },
    { dish: "Pork Green Thai Curry", price: 5.75 },
    { dish: "Stir-fry Duck with Ginger", price: 5.75 },
    { dish: "Stir-fry Beef with Mushroom", price: 5.75 },
    { dish: "Stir-fry Squid with Veg", price: 5.75 },
    { dish: "Mixed Seafood", price: 4.75 },
    { dish: "Spring Rolls (6)", price: 3.50 }
    ]

  def initialize(message = Message)
    @menu = MENU
    @basket = []
    @total = 0
    @message = message.new
  end

  def view_menu
    @menu
  end

  def add(dish_name, quantity, dish = Dish)
    if in_basket?(dish_name)
      find_in_basket(dish_name)[:quantity] += 1
    else
      @basket << dish.new(dish_name, quantity,
        select_dish(dish_name)[0][:price]).add
    end
  end

  def place(payment)
    @basket.each do |item|
      @total += (item[:price] * item[:quantity])
    end
    raise ERROR_MSG if payment < @total
    @message.send
    @total
  end

  private
  def in_basket?(dish_name)
    @basket.any? { |item| item[:dish] == dish_name }
  end

  def find_in_basket(dish_name)
    @basket.detect { |item| item[:dish] == dish_name }
  end

  def select_dish(dish_name)
    @menu.select { |item| item[:dish] == dish_name }
  end
end
