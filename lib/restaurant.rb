require './lib/menu'
require './lib/order'
require './lib/sms'

class Restaurant

  attr_reader :takeaway_menu, :current_basket

  def initialize(menu = Menu.new, current_basket = nil)
    @takeaway_menu = menu
    @current_basket = current_basket
  end

  def print_takeaway_menu
    add_takeaway_menu
    @takeaway_menu.print_list
  end

  def order(dish, quantity = 1)
    @takeaway_menu.contain?(dish)
    order_manager(dish, quantity)
    "#{dish} x #{quantity} added to your basket:)"
  end

  def order_summary
    raise basket_error if @current_basket == nil
    @current_basket.summary
  end

  def checkout(amount, sms = Sms.new)
    raise checkout_error unless amount == order_total
    sms.send
  end

  private

  def add_takeaway_menu
    @takeaway_menu.add_dish("Vongole", 14.25)
    @takeaway_menu.add_dish("Lasagne", 12.60)
    @takeaway_menu.add_dish("Margherita", 8.95)
    @takeaway_menu.add_dish("Vegetariana", 12.95)
    @takeaway_menu.add_dish("Tiramisu", 5.95)
    @takeaway_menu.add_dish("Prosecco", 7.00)
  end

  def order_manager(dish, quantity)
    price = @takeaway_menu.price?(dish)
    if @current_basket == nil
      @current_basket = Order.new
    end
    @current_basket.add(dish, price, quantity)
  end

  def basket_error
    "Your basket is empty!"
  end

  def checkout_error
    "The amount you paid was wrong."
  end

  def order_total
    @current_basket.sum
  end

end
