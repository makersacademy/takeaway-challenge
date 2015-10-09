require_relative 'menu2'

class Customer

  attr_reader :menu

  def initialize
    @menu = Menu.new
    @order = []
    @order_total = []
  end

  def select_dishes(dish, quantity=1)
    fail "This dish is not on our menu" unless menu.menu_items.key?(dish)
    quantity.times do |order| @order << dish
    end
  end



end
