require_relative 'menu'

class Order
  def initialize
    @items = Hash.new(0)
    @dish_total = Hash.new
    @total = 0
  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
    @dish_total[dish] = quantity * Menu::MENU[dish]
    @dish_total.each { |_dish, sum| @total += sum }
  end

  def display_basket
    string = ""
    @dish_total.each { |dish, sum| string << "#{dish} x#{@items[dish]} = £#{sum}. " }
    string
  end

  def total
    @total
  end

  def display_total
    "Total = £#{@total}"
  end
end
