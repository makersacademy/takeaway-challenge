require_relative './menu.rb'

class CheckOrder
  include Menu
  attr_accessor :new_order

  def initialize(new_order = [], menu = Menu::MENU)
    @new_order = new_order
    @menu = menu
  end

  def check_order_is_valid
    # check first if all dishes ordered are within the menu, then check total
    check_dishes_are_valid ? check_total ? true : false : false
  end

  def check_dishes_are_valid
    @o_dishes, @m_dishes = [], []
    @new_order[0..-2].each { |i| @o_dishes << i[:dish] }
    @menu.each { |i| @m_dishes << i[:dish] }
    @o_dishes.each { |i| return false unless @m_dishes.include?(i) }
    return true
  end

  def check_total
    t_in_o, total = @new_order[-1], 0
    @new_order[0..-2].each { |i|
      @menu.each { |j|
        total += (j[:price] * i[:total]) if j[:dish] == i[:dish]
      }
    }
    total == t_in_o
  end
end
