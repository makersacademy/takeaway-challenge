require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_accessor :menu, :order, :total

  def initialize
    @order = []
    @menu = Menu::MENU
    @total = 0
  end

  def add_to_order(dish)
    fail "#{dish} is not on the menu!" unless dish?(dish)
    @order << dish
    @total += @menu[dish]
  end
  #
  #   def total_correct?
  #     balance = 0
  #     @order.map do |dish|
  #       balance += @menu[dish]
  #     end
  #     @total == balance
  #   end
  def price_of_order

  end

  private

  def dish?(dish)
    @menu[dish]
  end

end
