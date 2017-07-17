require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket, :bill, :dispatched

  def initialize(dishes)
    @menu = Menu.new dishes
    @basket = Array.new
    @bill = 0
    @dispatched = false
  end

  def display_menu
    puts @menu.print_dishes
  end

  def order(dish, quantity)
    price = menu.dishes[dish]
    calculate(dish, quantity, price)
  end

  def basket_summary
    @basket.each do |dish, quantity, price|
      puts "#{dish} x#{quantity} = #{'%.02f' % (price * quantity)}"
    end
  end

  def total
    "Total: #{@bill}"
  end

  def checkout(price)
    return "Amount not correct" unless price == @bill
    message
  end

  def message
    puts 'You should receive a confirmation message'
    @dispatched = true
  end

  def calculate(dish, quantity, price)
    @bill += price * quantity
    update_order(dish, quantity, price)
  end

  def update_order(dish, quantity, price)
    @basket << [dish, quantity, price]
    puts "#{quantity}x #{dish}(s) added to your basket."
  end
end
