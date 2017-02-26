class Order

  attr_reader :current_order, :bill

  def initialize
    @menu = Menu.new
    @current_order = []
    @bill = 0
  end

  def order_received(food_order, quantity)
    raise "There is no #{food_order} available on the menu" unless on_menu?(food_order)
    save_order(food_order, quantity)
    "Order received for #{quantity} #{food_order}."
  end

  def check_bill
    "The bill is currently £#{@bill}."
  end

  def check_total

  end

  private

  def on_menu?(food_order)
    @menu.food_options.has_key?(food_order)
  end

  def save_order(food_order, quantity)
    @menu.food_options.each do | dish, cost |
      if dish == food_order
          cost = cost * quantity
          @bill += cost
          @current_order << { dish => cost }
      end
    end
  end

end
