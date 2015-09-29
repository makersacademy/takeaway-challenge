require_relative 'menu'

class Order

  attr_reader :ordered_dishes, :order_total
  PART_I_LENGTH = 42
  PART_II_LENGTH = 8

  def initialize
    @ordered_dishes = []
    @order_total = 0
  end

  def add_to_order(dish,quantity)
    @ordered_dishes << {dish:dish,quantity:quantity}
  end

  def display_order_on_email
    display = display_order_title
    display += display_order_body
    display += display_order_total
  end

  def display_order_on_sms
    display = display_order_on_email
    totals_line = "-"*(PART_I_LENGTH + PART_II_LENGTH)
    new_totals_line = "-"*((PART_I_LENGTH + PART_II_LENGTH)/2)
    display.gsub!("\n\n","\n")
    display.gsub!(" ","")
    display.gsub!("£"," £ ")
    display.gsub!(totals_line,new_totals_line)
    display
  end

  private

  def display_order_title
    title = "Order Details"
    title_spacing = (PART_I_LENGTH + PART_II_LENGTH - title.length)/2
    " "*title_spacing + "#{title}\n\n"
  end

  def display_order_body
    display = ''
    ordered_dishes.each{|dish| display += add_line_to_order_display(dish)}
    display
  end

  def display_order_total
    display = ''
    display += "-"*(PART_I_LENGTH + PART_II_LENGTH) + "\n"
    ordered_dishes.each{|dish| @order_total+=dish[:dish].price*dish[:quantity]}
    grand_total = '%.2f' % order_total
    part_i_spaces = PART_I_LENGTH - 'Total'.length
    part_ii_spaces = PART_II_LENGTH - '£'.length - grand_total.length
    display += 'Total'+" "*part_i_spaces+'£'+" "*part_ii_spaces+grand_total
  end

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
