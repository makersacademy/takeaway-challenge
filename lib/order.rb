# Understands the order process
require_relative 'menu'
require_relative 'messenger'

class Order

attr_reader :basket, :messenger

  def initialize(messenger = Messenger)
    @basket = Hash.new
    @menu = Menu.new
    @messenger = messenger
  end

  def view_menu
    @menu.view_menu
  end

  def add_dish(dish, quantity)
    fail 'This dish is not available' unless check_menu?(dish)
    if @basket.key?(dish)
      @basket[dish] += quantity
    else
        @basket[dish] = quantity
    end
    print "You have added #{quantity}x #{dish}(s) to your basket."
  end

  def check_total
    price = 0
    @basket.each {|dish, quantity|
      price += @menu.view_menu[dish] * quantity
    }
    price
  end

  def compare_price(customer_price)
    fail "Price error" unless self.check_total == customer_price
    @messenger.confirm_order
  end

private
  def check_menu?(dish)
    @menu.view_menu.key?(dish)
  end
end
