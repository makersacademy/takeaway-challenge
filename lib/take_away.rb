require_relative './menu'

class TakeAway
  def initialize(menu: Menu.new)
    @menu = menu
    @cart = []
  end

  def menu
    @menu.list_dishes
  end

  def add_to_cart(name, quantity = 1)
    new_dish = @menu.select_dish(name, quantity)
    update_dish_quantity(new_dish) || @cart << new_dish
  end

  def cart
    @cart
  end

  def update_dish_quantity(new_dish)
    edit = false
    @cart.each do |item|
      if item[:dish] == new_dish[:dish]
        item[:quantity] += new_dish[:quantity]
        edit = true
      end
    end
    edit
  end

  def total_price
    total = @cart.reduce(0) { |memo, item|
      price = item[:price].scan(/\d+[.]\d+/).join('').to_f
      memo + (price * item[:quantity])
    }
    "total price: £#{total}"
  end

end
