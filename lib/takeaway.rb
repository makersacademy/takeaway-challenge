require_relative 'menu'
require 'forwardable'

class Takeaway

  extend Forwardable
  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket =Hash.new(0)
  end

  def_delegator :@menu, :see_menu

  def order(dish, quantity = 1)
    count = quantity + basket[dish] if basket[dish]
    basket[dish] = count
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def basket_summary
    summary = []
    basket.each do |name, quantity|
      summary << "#{name} x#{quantity} = £#{menu.menu_list[name]*quantity}"
    end
    summary.join(', ')
  end

  def total
    summary = 0
    basket.each do |name, quantity|
      summary += menu.menu_list[name]*quantity
    end
    "Total: £#{format("%.2f", summary)}"
  end
end