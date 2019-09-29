require_relative 'order'
require_relative 'notifier'
require 'date'


class TakeAway
  attr_reader :basket, :total
  attr_writer :menu

  def initialize(order_class: Order, notifier_class: Notifier)
    @order_class = order_class
    @notifier_class = notifier_class
    @basket = []
    @total = 0
    @menu = [
      { name: 'Chicken Poke', price: 7.99 },
      { name: 'Salmon Poke', price: 8.99 },
      { name: 'Duck Dumpling', price: 4.99 },
      { name: 'Prawn Dumpling', price: 5.45 },
      { name: 'Coke', price: 0.95 },
      { name: 'Still Water', price: 0.95 }
            ]
  end

  def read_menu
    puts(@menu.map { |i| "#{i[:name]} £#{i[:price]}" })
  end

  def order_dish(dish, quantity = 1)
    fail "This dish doesn't exist" unless dish_exists?(dish)
    order = @order_class.new(dish, quantity, get_dish_price(dish))
    add_order(order)
  end

  def print_basket
    @basket.map { |order|
      puts "#{order.dish} x#{order.quantity} = £#{order.order_price}"
    }
  end

  def check_total
    puts "Total: £#{@total}"
  end

  def deliver_order
    now = now_time
    txt = "Thank you for your order: £#{@total}. Your order was placed and will be delivered before #{now}"
    send_text(txt)
    puts txt
  end

  private

  def now_time
    time = Time.new
    (time.hour + 1).to_s + ":#{time.min}"
  end

  def send_text(txt)
    notifier = @notifier_class.new
    notifier.send_message(txt)
  end

  def dish_exists?(dish)
    @menu.map { |i|
      if i[:name] == dish
        return true
      end
    }
    return false
  end

  def add_order(order)
    update_total(order.order_price)
    update_basket(order)
  end

  def get_dish_price(dish)
    @menu.map { |i|
      if i[:name] == dish
        return i[:price]
      end
    }
  end

  def update_total(order_price)
    @total += order_price
  end

  def update_basket(order)
    @basket << order
    puts "#{order.quantity} #{order.dish} added to your basket" # to check
  end
end
