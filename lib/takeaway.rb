require './lib/restaurant'

class TakeAway
  attr_reader :restaurant, :dish, :basket

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @dish = ""
    @basket = Hash.new(0)
  end

  def read_menu
    restaurant.read_menu
  end

  def order(dish, qty=1)
    fail "This dish is not available on menu" if not_on_menu?(dish)
    basket[dish] += qty
    "#{qty}x #{dish}(s) added to your basket."
  end

  def basket_summary
    fail "basket is empty, no dishes ordered" if basket.empty?
    my_basket
  end

  def order_value
    "Total: "+ sprintf('£%.2f', total)
  end

  def confirm_order(amount=0)
    fail "There are no dishes ordered, please order some first" if basket.empty?
    fail "£#{sprintf('%.2f', amount)} does not match order value of #{sprintf('£%.2f', total)}" if amount != total
    restaurant.complete_order("#{basket_summary}\n#{order_value}")
  end

  private

  def total
    total = basket.map {|dish, qty| (qty * restaurant.menu[dish])}
    total.inject {|sum, amount| sum + amount}.round(2)
  end

  def my_basket
    basket.map {|dish, qty| "#{dish} x#{qty} = #{'£%.2f' % (qty * restaurant.menu[dish])}"}.join(', ')
  end

  def not_on_menu?(dish)
    restaurant.menu.key?(dish) == false
  end

end
