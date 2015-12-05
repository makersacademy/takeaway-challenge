require_relative 'menu'

class Takeaway

  attr_reader :menu_klass, :complete_order

  def initialize(menu_klass = Menu.new)
    @menu_klass = menu_klass
    @complete_order = {}
    @total_dishes = 0
  end

  def select_order(item, qty)
    @complete_order[item] = qty
  end

  def total_of_dishes
    number_of_dishes
  end

  private

  def number_of_dishes
    @complete_order.each_value {|value| @total_dishes += value}
    @total_dishes
  end

end
