require_relative "menu"
require_relative "message"
require_relative "dish"
require "Time"

class Takeaway
  attr_reader :menu, :cart

  def initialize(menu = Menu.new, message = Message.new)
    @menu = menu
    @cart = []
    @message = message
  end

  def select_dish(num)
    fail "This dish is not in the menu" unless in_menu?(num)

    @cart << @menu.dish_list[num - 1]
  end

  def view_cart
    puts "This your selection of dishes so far:"
    checkout_view
    total
  end

  def place_order
    t = Time.now
    confirmation = "Thank you! Your order was placed and will be delivered before #{(t + 3600).strftime("%H:%M")}"
    @message.send(confirmation)
  end

  private

  def in_menu?(num)
    [*1..@menu.dish_list.length].include?(num)
  end

  def checkout_view
    the_list = []
    @cart.map { |item|
      the_list << "#{@cart.count(item)} x #{item.name}: $#{@cart.count(item) * item.price}"
    }
    puts the_list.uniq
  end

  def total
    to_pay = 0
    @cart.map { |item|
      to_pay += item.price
    }
    puts "THE TOTAL IS: $#{to_pay.truncate(2)}"
  end
end
