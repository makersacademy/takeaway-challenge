require './lib/restaurant'
require './lib/menu'
class TakeAway
  attr_reader :restaurant, :menu, :dish, :basket

  def initialize(restaurant = Restaurant.new, menu = Menu.new)
    @restaurant = restaurant
    @menu = menu
    @dish = ""
    @basket = Hash.new(0)
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
    "Total: "+ format('£%.2f', total)
  end

  def confirm_order(amount=0)
    fail "There are no dishes ordered, please order some first" if basket.empty?
    fail "Confirm order value of #{format('£%.2f', total)}" if amount != total
    restaurant.complete_order(amount)
  end

  private

  def total
    total = basket.map {|dish, qty| (qty * @menu.items[dish])}
    total.inject {|sum, amount| sum + amount}.round(2)
  end

  def my_basket
    basket.map do |dish, qty|
      amount = qty * @menu.items[dish]
      order_list = "#{dish} x#{qty} = #{format('£%.2f', amount)}"
    end.join(', ')
  end

  def not_on_menu?(dish)
    menu.can_order?(dish) == false
  end

end
