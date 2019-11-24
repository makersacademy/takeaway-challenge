require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_reader :dishes, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def add_to_basket(dish, quantity)
    fail "This item is not on the menu!" unless @menu.dish?(dish)

    # hash = { :dish => quantity }
    puts "added #{quantity} #{dish} to basket."
    @basket[dish] = quantity
  end

  def total
    @basket.map do |dish, quantity|
      @menu.price(dish) * quantity
    end
  end

  def bill
    total.inject(:+)
  end
end
