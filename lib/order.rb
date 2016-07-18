require_relative 'menu'
require_relative 'checkout'

class Order
  attr_reader :basket, :total, :menu

  def initialize(menu = Menu.new)
    @total = 0
    @basket = []
    @menu = menu
  end

  def add_to_basket(name, quantity = 1)
    fail "That wasn't on the menu" unless @menu.menu_list.has_key?(name)
    quantity.times do
      @basket << name
    end
  end

  def total
    @basket.map do |dish|
      @total += @menu_list[dish]
    end
    @total
  end

  def proceed_to_checkout
    @checkout = Checkout.new
  end
end
