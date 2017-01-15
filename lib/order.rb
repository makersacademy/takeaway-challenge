require_relative 'menu'
require_relative 'delivery' # TODO delete?
require_relative 'basket'

 #TODO extract basket obj:
 # can add and remove items. Basket can say if is in basket and how many
 # calculating order remains with Order

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = {} # TODO will init nil once extracted to be an object
    @menu = Menu.new
  end

  def add(dish, qty)
    # TODO create basket object if not existing here
    raise not_on_menu_msg unless menu.has?(dish)
    add_to_basket(dish, qty)
  end

  def remove(dish)
    raise not_in_basket_msg unless basket.key?(dish)
    remove_from_basket(dish)
  end

  def cancel
    @basket  = {}
  end

  def buy
    confirmation_msg + delivery_time
  end

  def view
    display_header
    display_basket
    display_total
  end

  private

  def not_on_menu_msg
    "The requested item is not on the menu"
  end

  def not_in_basket_msg
    "You have not ordered this item"
  end

  def confirmation_msg
    "Thank you. Your order was placed and will be delivered before "
  end

  def delivery_time
    "#{(Time.now.hour + 1).modulo(24)}:#{Time.now.min}."
  end

  def display_header
    print "\nYOUR ORDER\n\n"
    printf("%-20s %5s %8s\n","ITEM","QTY","PRICE")
  end

  def display_basket
    basket.each { |k,v| printf("%-20s %5d %8.2f \n", k, v, menu.items[k]) }
  end

  def display_total
    printf("\n%-10s %6.2f\n\n", "TOTAL = ", total)
  end

  def total
    t = 0.00
    basket.each_key { |k| t = t + basket[k] * menu.items[k] }
    t
  end

  def in_basket?(dish)
    basket.key?(dish)
  end

  def add_to_basket(dish, qty)
    in_basket?(dish) ? increase(dish, qty) : new_item(dish, qty)
  end

  def remove_from_basket(dish)
    basket.delete(dish)
  end

  def increase(dish, qty)
    @basket[dish] += qty
  end

  def new_item(dish, qty)
    @basket[dish] = qty
  end
end
