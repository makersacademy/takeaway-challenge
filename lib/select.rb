require_relative 'dishes'

class Select
  attr_accessor :menu

  def initialize(menu: Dishes.new)
    @menu = [{ toast: 3, cereal: 2, coffee: 2 }]
  end

  def order(dishes)
    @order = dishes
  end
end
