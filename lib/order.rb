require_relative 'menu'

class Order

  attr_reader :ordered_dishes

  def initialize
    @ordered_dishes = []
  end

  def add_to_order(dish,quantity)
    add_to_order  = {dish:dish,quantity:quantity}
    @ordered_dishes << add_to_order
  end

  def display_order
    total_price = 0
    display = " "*10 + "Order Details \n\n"
    ordered_dishes.each do |dish_hash|
      display += add_line_to_order_display(dish_hash)
      total_price += dish_hash[:dish].price * dish_hash[:quantity]
    end
    display += "-"*27 + "\n"
    total_price = total_price.round(2).to_s
    total_price += "0" if total_price[-2] == "."
    display += "Total:                £ " + total_price
    display
  end

  private

  def add_line_to_order_display(dish_hash)
    price = (dish_hash[:dish].price * dish_hash[:quantity]).round(2).to_s
    price += "0" if price[-2] == "."
    dish_hash[:dish].name + " @ " + dish_hash[:dish].price.to_s + " x " +
    dish_hash[:quantity].to_s + "  £ " + price + "\n"
  end

end
