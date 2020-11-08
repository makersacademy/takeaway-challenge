require_relative 'menu'

class Order

  attr_reader :basket, :total, :menu

  def initialize(total = 0)
    @basket = []
    @total = total
    @menu = Menu::DISHES
  end

  def add(dish, quantity = 1)
    raise "Dish not on menu" unless on_menu?(dish)

    quantity.times { @basket << { dish: dish, price: @menu[dish] } }
    @total += (@menu[dish] * quantity)
  end

  def checkout
    if empty?
      print "Your basket is empty"
    else
      @basket.each { |items| puts items }
      puts "Your total to pay is £#{@total}"
    end
  end

  def pay(amount)
    raise StandardError.new "Incorrect amount. Please pay #{@total}" if amount != @total

    puts "Thank you! Your order was placed and will be delivered within 1 hour."
  end

  private

  def on_menu?(dish)
    @menu.key?(dish)
  end

  def empty?
    @basket.empty?
  end

end
