require_relative 'menu'

class Order

  attr_reader :current, :menu

  def initialize(menu)
    @menu = menu
    @current = []
  end

  def add(dish,quantity=1)
    fail ArgumentError, 'Need to select how many you want' if quantity < 1
    fail ArgumentError, "#{dish} is not on the menu" unless on_menu?(dish)
    price_of_dish = menu[dish]
    current << [quantity, dish, price_of_dish]
  end

  def show_sum
    calculate_price
  end

  def show_selection
    ["Total sum for order is: £#{show_sum}", current]
  end


  private

  def on_menu?(dish)
    menu.has_key?(dish)
  end

  def calculate_price
    current.inject(0){|sum,selection| sum + (selection[0]*selection[2])}
  end
end
