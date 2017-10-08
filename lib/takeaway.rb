require 'twilio-ruby'


class Takeaway

  attr_reader :menu, :basket, :total

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
    raise "total is not correct, unable to secure order" if order_total != total
    confirmation
    Message.send
  end


  private
  # why isnt this working
  # def error_total?
  #   order_total != total
  # end

  def confirmation
    "Thank you! Your order with a total of #{total} has been confirmed"
  end
end
