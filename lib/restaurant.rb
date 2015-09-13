require_relative 'menu.rb'

class Restaurant
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = {}
  end

  def make_order(dish, quantity)
    fail "Cannot order items not on the menu" unless menu.on_menu?(dish)
    if order.include?(dish)
      order[dish] += quantity
    else
      order.store(dish, quantity)
    end
  end

  def reciept
    "Total cost: £#{total}\n Which is #{ind_total.join(", ")}"
  end

  def review
    order.collect{|price, quantity| "order = #{dish}: #{quantity}"}.join(", ")
  end

  private

  def total
    order.collect{|dish, quantity| menu.items[dish] * quantity}.inject(:+)
  end

  def ind_total
    order.collect{|dish, quantity| "#{dish}: £#{menu.items[dish] * quantity}" }
  end
end
