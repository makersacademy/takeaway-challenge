require_relative 'menu'
#require './lib/restaurant'

class Order

  attr_reader :order, :checkout

  def initialize (menu_class = Menu)
    @menu = menu_class.new
    @order = []
    @checkout = false
  end

  def add_item_qty choice, qty
   raise "item not available" unless check_on_menu?(choice)
    price = get_price(choice) #adds the price to the order
    order << [choice,qty,price]
    "#{qty}x #{choice} added to your basket."
  end

  def basket_summary
    #accesses the order variable which is initialized in the object where the order is stored
    raise "basket is empty" if @order == []
    order.map{|unit,qty,price|  "#{unit} x#{qty} = #{qty*price}"}.join(", ")
  end

  def view_menu
    @menu.view_menu
  end

  def remove_item(index)
    @order.delete_at(index)
  end

  def checkout_order(total)
    total == order_total ? @checkout = true : @checkout = false
  end

  private

  def order_total
    order.map{|x| x[1]*x[2]}.inject{|acc,x| acc+=x}.round(2)
  end
  def check_on_menu?(choice)
    view_menu.key?(choice)
  end

  def get_price(choice)
    view_menu[choice]
  end
end

