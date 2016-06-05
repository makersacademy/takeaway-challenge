require_relative 'order'

class Menu

  NAME_LIST = {1=>"Chicken Fried Rice", 2=>"Curry", 3=>"Stir-Fried Noodles", 
               4=>"Prawn Cocktail", 5=>"Barbeque Pork Noodles", 6=>"Deep-fried Prawns", 
               7=>"Vegetable Spring Rolls", 8=>"Crisy Duck", 9=>"Deep-fried Tofu", 
               10=>"Shrimp Fried Rice"}
  PRICE_LIST = {1=>5.00, 2=>6.50, 3=>7.00, 4=>5.00, 5=>3.50, 6=>7.50, 7=>5.00, 8=>6.00, 
                9=>7.50, 10=>15.50}


  attr_reader :current_order


  def initialize(order_class = Order)
    @order_class = order_class
    @current_order = nil
  end


  def display_menu
    line_length = 40
    return_string = "Available dishes:\n\n" + display_dish_line(40, "menu") + "\n"
  end


  def choose_dishes(*selections)
    @current_order = @order_class.new if @current_order == nil 
    current_order.add_dishes(selections)
  end


  def check_order
    line_length = 40
    return_string = "Current order contains:\n\n" + display_dish_line(40, "order") + display_total(40)
  end


  def place_order
    confirmation = current_order.place_order
    @current_order = nil
    return confirmation
  end



  private


  def display_dish_line(line_length, type)
    return_string = ''
    type == "order" ? source = current_order.show_dishes : source = NAME_LIST
    source.each do |n, val|
      type == "order" ? dish = "#{NAME_LIST[n]} x #{val}" : dish = "#{n}) #{val}"
      type == "order" ? price = "£#{'%.2f'%(PRICE_LIST[n] * val)}" : price = "£#{'%.2f'%PRICE_LIST[n]}"
      return_string += dish + spaces(line_length, dish, price) + price + "\n"
    end
    return_string
  end


  def display_total(line_length)
    final_line = "Total Price:"
    total = "£#{'%.2f'%current_order.show_dishes.inject(0){|total, (dish, n)| total + PRICE_LIST[dish] * n}}"
    return_string = "\n" + final_line + spaces(line_length, final_line, total) + total + "\n\n"
  end


  def spaces(line_length, *strings_in_line)
    ' ' * (line_length - strings_in_line.reduce(:+).length)
  end

end

# menu = Menu.new
# puts menu.spaces(40, "Noodles", "$5.00")
# puts menu.display_menu
# menu.choose_dishes([1,1], [3,2], [5,3], [10, 2])
# puts menu.check_order

