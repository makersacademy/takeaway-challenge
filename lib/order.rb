require_relative 'menu'

class Order
  attr_reader :items, :dish_total, :total
  def initialize
    @items = Hash.new(0)
    @dish_total = Hash.new
    @total = 0
  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
    @dish_total[dish] = quantity * Menu::MENU[dish]
  end

  def display_basket
    string = ""
    @dish_total.each { |dish, sum| string << "#{dish} x#{@items[dish]} = £#{sum}. " }
    string
  end

  def total
    @dish_total.each { |_dish, sum| @total += sum }
    "Total = £#{@total}"
  end
end
