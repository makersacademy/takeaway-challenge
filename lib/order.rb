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
    display = " "*20 + "Order Details           \n\n"
    ordered_dishes.each do |dish_hash|
      display += add_line_to_order_display(dish_hash)
      total_price += dish_hash[:dish].price * dish_hash[:quantity]
    end
    display += "-"*53 + "\n"
    total_price = total_price.round(2).to_s
    total_price += "0" if total_price[-2] == "."
    total_line_space = 44 - total_price.length
    display += "Total:" + " "*total_line_space + " £ " + total_price
    display
  end

  private

  def add_line_to_order_display(dish_hash)
    line_to_add = ''
    space_length = 40 - dish_hash[:dish].name.length
    price = (dish_hash[:dish].price * dish_hash[:quantity]).round(2).to_s
    price += "0" if price[-2] == "."
    price_space = 7 - price.length
    dish_hash[:dish].name + " x " + dish_hash[:quantity].to_s + " "*(space_length+price_space) + "£ " + price + "\n"
  end

end
