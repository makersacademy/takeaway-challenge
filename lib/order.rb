require_relative 'menu'

class Order

  attr_reader :ordered_dishes
  PART_I_LENGTH = 42
  PART_II_LENGTH = 8

  def initialize
    @ordered_dishes = []
  end

  def add_to_order(dish,quantity)
    @ordered_dishes << {dish:dish,quantity:quantity}
  end

  def display_order
    order_total = 0
    title = "Order Details"
    title_spacing = (PART_I_LENGTH + PART_II_LENGTH - title.length)/2
    display = " "*title_spacing + "Order Details\n\n"
    ordered_dishes.each do |dish_hash|
      display += add_line_to_order_display(dish_hash)
      order_total += dish_hash[:dish].price * dish_hash[:quantity]
    end
    display += "-"*(PART_I_LENGTH + PART_II_LENGTH) + "\n"
    order_total = order_total.round(2).to_s
    order_total += "0" if order_total[-2] == "."
    display += "Total:                £ " + order_total
    display
  end

  private

  def add_line_to_order_display(dish_hash)
    line_part_i(dish_hash) + line_part_ii(dish_hash)
  end

  def line_part_i(dish_hash)
    line_part_i_text = dish_hash[:dish].name + " @ " +
    dish_hash[:dish].price.to_s + " x " + dish_hash[:quantity].to_s
    line_part_i_spaces = PART_I_LENGTH - line_part_i_text.length
    line_part_i = line_part_i_text + " " * line_part_i_spaces
  end

  def line_part_ii(dish_hash)
    total_price = '%.2f' % (dish_hash[:dish].price * dish_hash[:quantity])
    line_part_ii_spaces = PART_II_LENGTH - "£".length - total_price.length
    line_part_ii = "£" + " "*line_part_ii_spaces + total_price + "\n"
  end
end
