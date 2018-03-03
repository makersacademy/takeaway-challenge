require 'order'

class TakeAway
  attr_reader :menu, :curr_order

  def initialize(order = Order)
    @order = order
  end

  def show_menu
    puts menu_details
  end

  def start_order(order_ref)
    @curr_order = @order.new(order_ref)
  end

  def complete_order(order_ref)
    "Thank you! Your order #{@curr_order.order_ref} was placed and will be delivered before 18:52"
  end

  private

  def menu_details
    @menu = [
      { dish: "Crispy Duck", price: 14.00},
      { dish: "Sweet & Sour Chicken", price: 5.50},
      { dish: "Shredded Chilli Beef", price: 6.00 },
      { dish: "Egg Fried Rice", price: 2.10 }
    ]
  end

end
