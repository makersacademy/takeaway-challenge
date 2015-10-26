require_relative "menu"

class Order

  attr_reader :order_log, :sum, :menu_klass, :total, :menu
  def initialize(menu_klass = Menu.new)
    @order_log = Hash.new(0)
    @sum = []
    @menu_klass = menu_klass
    @menu = @menu_klass.menu_list
  end

  def add_to(food, quantity)
    @sum << @menu_klass.price(food) * quantity
    @order_log[food.to_sym] += quantity
  end

  def total
    @total = @sum.reduce(:+)
  end

end
