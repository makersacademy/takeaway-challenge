require_relative 'order'

class TakeAway
  attr_reader :basket, :basket_checkout, :printed_menu, :total
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
    @printed_menu = @menu.map { |i| "#{i[:name]} £#{i[:price]}" }
    puts @printed_menu
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

  private

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

# take = TakeAway.new
# take.read_menu
# puts
# take.print_out([{ name: 'Prawn Dumpling', price: 5.45, quantity: 5 }])
