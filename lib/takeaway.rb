require_relative 'menu'
class Takeaway

  attr_reader :menu_klass, :total_dishes, :order, :total_cost

  def initialize(menu_klass = Menu.new)
    @menu = menu_klass
    @order = Hash.new
    @total_dishes = 0

  end

  def select(item, qty=1)
    @order[item] = qty
    "You have added #{qty} #{item}(s) to your basket"
  end

  def total_dishes_ordered
    number_of_dishes
  end

  def number_of_dishes
    @order.each_value { |value| @total_dishes += value }
    @total_dishes
  end

  def price_matcher name
    @menu.dishes[name]
  end

  def total_price
    total = 0
    @order.each { |name, qty| total += (qty * price_matcher(name))}
    total

  end


end
