class Order

  attr_reader :current_order, :bill, :string_summary

  def initialize
    @menu = Menu.new
    @current_order = []
    @bill = 0
    @string_summary = ''
  end

  def order_received(food_order, quantity = 1 )
    raise "There is no #{food_order} available on the menu" unless on_menu?(food_order)
    save_order(food_order, quantity)
    "Order received for #{quantity} #{food_order}."
  end

  def check_total
    raise "There is an error - your bill is not the same as the item cost." unless bill_correct?
    to_two_decimals = sprintf('%.2f', @bill)
    "The bill is currently £#{to_two_decimals}."
  end

  private

  def on_menu?(food_order)
    @menu.food_options.has_key?(food_order)
  end

  def save_order(food_order, quantity)
    array_save_order(food_order, quantity)
    string_save_order(food_order, quantity)
  end

  def array_save_order(food_order, quantity)
    @menu.food_options.each do | dish, cost |
      if dish == food_order
          cost = cost * quantity
          @bill += cost #needs to be purely functional - is saving to an instance variable and will cause problems in the future!
          @current_order << { dish => cost }
      end
    end
  end

  def string_save_order(food_order, quantity)
    @menu.food_options.each do | dish, cost |
      if dish == food_order
        cost = sprintf( "%0.02f", cost * quantity)
        @string_summary += " #{dish} x #{quantity}: £#{cost} |"
      end
    end
  end

  def bill_correct?
    running_total = 0
    @current_order.each do |search_hash|
      search_hash.each do |dish, cost|
       running_total += cost
    end
  end
    @bill == running_total
  end


end
