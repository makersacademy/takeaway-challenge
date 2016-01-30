require_relative 'menu'
class Takeaway

  extend Forwardable
  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket =[]
  end

  def_delegator :@menu, :see_menu

  def order dish, quantity = 1
    basket << {dish.to_sym => quantity}
    "#{quantity}x #{dish}(s)"
  end
end