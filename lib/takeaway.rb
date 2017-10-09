require 'twilio-ruby'


class Takeaway

  attr_reader :menu, :basket, :total, :order_total

  def initialize
    @menu = {"curry" => 1.00, "xcurry" => 1.00}
    @basket = {}
  end

  def print_menu
    @menu
  end

  def select_dish(dish, quantity)
    @basket[dish] = @menu[dish] * quantity
    #key on the left, right is value, put them into the has as a key/value pair
  end

  def empty_basket
    @basket = {}
  end

  def total
    @total = @menu.values.sum
  end

  def place_order(order_total)
    @order_total = order_total   #you have to set the argument order_total to equal @order_total
    raise "total is not correct, unable to secure order" if error_total?
    confirmation
    Message.send
  end

  private

  def error_total?
    @order_total != total
  end

  def confirmation
    "Thank you! Your order with a total of #{total} has been confirmed"
  end
end
