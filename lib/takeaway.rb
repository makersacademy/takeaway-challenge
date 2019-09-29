require_relative 'order'
require_relative 'notifier'
require_relative 'basket'
require 'date'


class TakeAway
  attr_reader :basket, :total
  attr_writer :menu

  def initialize(
    order_class: Order,
    notifier_class: Notifier,
    basket_class: Basket
  )
    @order_class = order_class
    @notifier_class = notifier_class
    @basket = basket_class.new
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
    @basket.add_item(order)
  end

  def deliver_order
    now = now_time
    txt = "Thank you for your order: £#{@basket.total.round(2)}. Your order was placed and will be delivered before #{now}"
    send_text(txt)
    puts txt
  end

  def print_basket
    @basket.print_basket
  end

  def check_total
    @basket.check_total
  end

  private

  def now_time
    time = Time.new
    "%d:%02d" % [(time.hour + 1), time.min]
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

  def get_dish_price(dish)
    @menu.map { |i|
      if i[:name] == dish
        return i[:price]
      end
    }
  end
end
