class Takeaway

  attr_reader :menu, :basket, :total

  def initialize
    @menu = Dishes.new
    @basket = {}
  end

  def print_menu
    @menu.list
  end

  def select_dish(dish)
    @basket[dish] = @menu.list[dish]
  end

  def total
    # @total = @list.inject(0) { |key, value| key += value[1] }
    @total = @menu.list.values.sum
  end


  def place_order#(order_total = gets.chomp)
    # puts "please confirm your order total"
    # order_total
    # raise "total is not correct, unable to secure order" if order_total.to_s != @total
    "Thank you! Your order with a total of #{total} has been confirmed"
  end

end
