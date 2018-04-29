require_relative 'menu'
class Order
  attr_reader :items, :m

  def initialize(menu = Menu.new)
    @m = menu
    @items = Hash.new(0)
    @total = 0
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
     "Thank you! Your order was placed and will be delivered before 21:30"
  end
end
