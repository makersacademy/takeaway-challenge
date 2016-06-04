require_relative 'order'

class Menu

  NAME_LIST = {1=>"Chicken Fried Rice", 2=>"Curry", 3=>"Stir-Fried Noodles"}
  PRICE_LIST = {1=>5, 2=>6, 3=>7}

  
  MENU = "Available dishes:

      1) Chicken Fried Rice     £5.00
      2) Curry                  £6.00
      3) Stir-Fried Noodles     £7.00

"

  attr_reader :current_order

  def initialize(order_class = Order)
    @order_class = order_class
    @current_order = nil
  end

  def display
    puts MENU
  end

  def choose_dishes(*selections)
    @current_order = @order_class.new if @current_order == nil 
    current_order.add_dishes(selections)
  end

  def check_order
    total_price = 0
    return_string = ''
    current_order.show_dishes.each do |(dish, quantity)|
      return_string += "#{NAME_LIST[dish]} x #{quantity} : £ #{PRICE_LIST[dish] * quantity}\n"
      total_price += PRICE_LIST[dish] * quantity
    end
    return_string += "Total Price: £#{total_price}"
  end

  def close_order
    current_order.place_order
    @current_order = nil
  end



end

# menu = Menu.new
# menu.display
# menu.choose_dishes([1,1], [3,2])
# menu.close_order

