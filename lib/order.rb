require_relative 'menu'
require_relative 'basket'

class Order
  attr_reader :basket, :menu
  def initialize
    @basket = Basket.new
    @menu = Menu.new
  end
  def add(item, qty)
    raise not_on_menu_error unless menu.has?(item)
    basket.add(item, qty)
  end
  def remove(item, qty)
    raise not_in_basket_error unless basket.has?(item)
    basket.remove(item, qty)
  end
  def cancel
    @basket  = Basket.new
  end
  def buy
    print "#{confirmation_msg} #{delivery_time}\n\n"
  end
  def view
    display_header
    display_basket
    display_total
  end

  private
  def not_on_menu_error
    "The requested item is not on the menu"
  end
  def not_in_basket_error
    "You have not ordered this item"
  end
  def confirmation_msg
    "Thank you. Your order was placed and will be delivered before"
  end
  def delivery_time
    "#{(Time.now.hour + 1).modulo(24)}:#{Time.now.min}"
  end
  def display_header
    print "\nYOUR ORDER\n\n"
    printf("%-20s %5s %8s\n","ITEM","QTY","PRICE")
  end
  def display_basket
    basket.items.each do |k,v|
      printf("%-20s %5d %8.2f \n", k, v, menu.items[k])
    end
  end
  def display_total
    printf("\n%-10s %6.2f\n\n", "TOTAL = ", total)
  end
  def total
    t = 0.00
    basket.items.each_key { |k| t += basket.items[k] * menu.items[k] }
    t
  end
end
