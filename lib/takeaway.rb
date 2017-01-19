require_relative 'menu'
require_relative 'order'
require 'money'


class Takeaway

  attr_reader :completed

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @completed = false
    @order = order
  end

  def get_menu
    menu.print_menu
  end

  def place_order(dish, quantity)
    return if completed?
    @order.add(dish, quantity)
  end

  def basket_summary
    print_basket_summary(@order.basket)
  end

private

attr_reader :menu, :order

def completed?
  @completed
end

def print_basket_summary(basket)
  basket.map { |elem| "#{elem[0].to_s.capitalize} x#{elem[1]} = #{Money.new(elem[2], "GBP", I18n.config.available_locales = :en).format(:symbol => true)}"}.join(", ")
end


end
