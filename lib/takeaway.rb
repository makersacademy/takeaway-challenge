class Takeaway

  attr_reader :menu, :basket, :total

  def initialize
    @menu = Dishes.new
    @basket = {}
  end

  def print_menu
    @menu.list
  end

  def select_dish(dish, quantity)
    @basket[dish] = @menu.list[dish] * quantity
    #key on the left, right is value, put them into the has as a key/value pair
  end

  def total
    @total = @menu.list.values.sum
  end

  def place_order(order_total)
    raise "total is not correct, unable to secure order" if order_total != total
    "Thank you! Your order with a total of #{total} has been confirmed"
  end




end
