class Takeaway

attr_reader :menu , :basket

  def initialize
    @menu = {"Pizza"=> 6, "Curry"=> 4, "Chips"=> 2}
    @basket = []
  end

  def order(dish, quantity)
    raise not_on_menu_msg if !@menu.has_key?(dish)
    # @basket << dish
     @basket << {dish => quantity}
     p "#{quantity} x #{dish} added to your basket!"
  end

  def order_summary
    # p "this is the order"
    result = Hash.new(0)
    @basket.each {|i| i.each { |item, num | result[item] += num } }
    # result
    puts "You have ordered:"
    result.each {|item, num | puts "#{item} x #{num}" }
    # 
    # # Trying to compare the item in the result against the same item in the menu, if they are the same, multiply by quantity so that subtotal = dish and new_price
    #
    # # result.each {|item, num | if item == { basket.each |dish, quantity | dish } puts "yes"  }
    # puts "Subtotal is:"
    # subtotal = Hash.new(0)
    # result.each {|dish, quantity | result[dish] == menu.select {|i, v | subtotal = result[quantity] * menu[v] } }

  end





  private

  def not_on_menu_msg
    "Not on the menu, please try again"
  end

end
