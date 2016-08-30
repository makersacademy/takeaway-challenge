require_relative 'menu'

class Order
attr_reader :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(1)
    @menu = menu
  end

  def select_dish(dish, amount = 1)
    check_menu(dish)
    basket[dish.to_sym] += amount
    puts "#{amount} #{dish} pizza#{amount == 1 ? "" : "s"} added to your basket"
  end

  def show_basket
    basket.dup
  end

  def order_summary
    puts "Your basket is as follows:"
    basket.each do |item, quantity|
      price = menu.list[item]
      puts "#{item} pizza x#{quantity} @ £#{price} each"
    end
    puts "Your total is £#{total}"
    total
  end

  def total
    @sum = 0
    basket.each do |item, quantity|
      price = menu.list[item]
      @sum += (price * quantity)
    end
    @sum
  end

  private

  attr_reader :basket

  def check_menu(item)
    fail "Not on the menu" if !(menu.list).include?(item.to_sym)
    true
  end

end
