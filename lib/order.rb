require_relative 'restaurant'

class Order

  attr_reader :receipt

  def initialize(restaurant_klass: Restaurant)
    @total = 0
    @restaurant_klass = restaurant_klass
    @restaurant = @restaurant_klass.new
    @receipt = ''
  end

  def total
    r = @total.round(2)
    puts "Your total is $#{r}"
    r
  end

  def see_menu
    @restaurant.menu
  end

  def place_order(item, quantity = [1])
    request_order(item,quantity)
    "your order has been successfully placed"
  end

  def finish_order(amount_due)
    message = "The amount given does not match the actual total"
    fail message unless amount_due == @total
    @restaurant.finish(@receipt + "Your total is $#{@total} and ")
    close_order
    "Thank you. A text has been sent to you with a copy of your receipt"
  end

  private

  def close_order
    @receipt = ''
    @total = 0
  end

  def request_order(item, quantity)
    item.each do |x|
      if see_menu.include?(x)
        q = quantity[item.index(x)]
        r = q*see_menu[x]
        @total += (r)
        @receipt += "#{x} x#{q} for $#{r.round(2)}. "
      else
        fail 'Sorry but your order is currently not on the menu'
      end
    end
  end
end
