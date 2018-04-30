require_relative 'menu'
require_relative 'messager'
class Order
  attr_reader :items, :m

  def initialize(menu = Menu.new, messager)
    @m = menu
    @items = Hash.new(0)
    @total = 0
    @messager = messager
  end

  def show_menu
    @m.list_dishes
  end

  def add_dish(dish, quantity = 1)
    @items[dish] += quantity if @m.contains?(dish)
  end

  def correct_order?(price)
    total == price
  end

  def total
    @items.each { |dish, quantity| @total += @m.menu[dish] * quantity }
    @total
  end

  def checkout
    @messager.send_text
  end
end
