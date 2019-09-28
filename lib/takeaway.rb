require_relative 'order'
require 'date'


class TakeAway
  attr_reader :basket, :basket_checkout, :total
  attr_writer :menu

  def initialize(order_class: Order)
    @order_class = order_class
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

    new_order = @order_class.new(dish, quantity, get_dish_price(dish))
    new_order.print_order
    add_order(dish, quantity, new_order.order_price)
  end

  def print_basket
    @basket_checkout = @basket.join(", ")
    puts @basket_checkout
  end

  def check_total
    puts "Total: £#{@total}"
  end

  def deliver_order(total)
    now = get_time
    send_text("Thank you for your order: £#{total}. Your order was placed and will be delivered before #{now}")
  end

  private

  def get_time
    time = Time.new
    (time.hour + 1).to_s + ":#{time.min}"
  end

  def send_text(txt)
    delivered = Notifier.new.send_message(txt)
  end

  def dish_exists?(dish)
    @menu.map { |i|
      if i[:name] == dish
        return true
      end
    }
    return false
  end

  def add_order(dish, quantity, order_price)
    update_total(order_price)
    update_basket(dish, quantity, order_price)
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

  def update_basket(dish, quantity, order_price)
    @basket << "#{dish} x#{quantity} = £#{order_price}"
  end
end
