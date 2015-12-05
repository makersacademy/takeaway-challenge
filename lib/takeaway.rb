require_relative 'menu'
class Takeaway

  attr_reader :menu_klass, :total_dishes, :order

  def initialize(menu_klass = Menu.new)
    @menu_klass = menu_klass
    @order = Hash.new
    @total_dishes = 0
  end

  def select(item, qty)
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


end
