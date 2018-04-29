require './docs/menu'

class Order

  attr_reader :menu, :basket, :order_summary_array

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @order_summary_array = []
  end

  def display_menu
    @menu.show_menu
  end

  def add_dish(dish, quantity)
    @basket << { dish => quantity }
  end

  def view_summary(basket)
    @basket
    @basket.each do |dish, quantity|
      dish_cost = Menu.new.menu_items[dish]
      total_price = dish_cost.to_i * quantity.to_i
      @order_summary_array.push("#{quantity.to_s} x #{dish} -£#{total_price}")
    end
    @order_summary_array
    # ["2 x Haddock - £10"]
  end
  # private
  # def total_price
  #   @menu.menu_items.each do |menu_dish, price|
  #     if dish = menu_dish
  #       total_price = quantity * price
  #     end
  #   end
  # end

end
