class Takeaway

  attr_reader :menu, :order_item, :order_price

  def initialize
    @menu = { Chicken: 5, 
              Steak: 8,
              Fish: 6,
              Sides: 4
            }
  end

  def show_menu
    puts "What would you like to eat? Please type your order"
    @menu.each { |k, v|
      p "#{k} = £#{v}" 
    }
  end

  def place_order(order)
    @cost = 0
    order.foods.each { |food|
      @cost += @menu[food.to_sym]
    }
    p "Thank you! Your order will cost £#{@cost} and will be delivered before" +
      " #{(Time.now + 60 * 60).strftime("%H:%M")}"
  end

end
