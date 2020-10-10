require_relative 'basket'

class Order
  def initialize(basket = Basket.new)
    @basket = basket
  end

  def show_order
    puts @basket.show
  end

  def add_item(item)
    @basket.add_item(item)
  end 
  
  def show_menu
    @basket.menu.print_menu
  end

  def place_order
    raise "Can't place an order with an empty basket!" if @basket.empty?

    @basket.clear
    "Thank you! Your order will arrive no later than #{(Time.now + 3600).strftime("%k:%M")}."
  end
end
