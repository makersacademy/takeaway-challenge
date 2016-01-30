require_relative 'menu'
class Takeaway

  extend Forwardable
  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket =Hash.new(0)
  end

  def_delegator :@menu, :see_menu

  def order(dish, quantity = 1)
    quantity += basket[dish] if basket[dish]
    basket[dish] = quantity
    "#{quantity}x #{dish}(s) added to your basket."
  end
end