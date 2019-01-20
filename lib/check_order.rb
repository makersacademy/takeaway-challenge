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
    order_dishes, menu_dishes = [], []
    @new_order[0..-2].each { |dish| order_dishes << dish[:dish] }
    @menu.each { |dish| menu_dishes << dish[:dish] }
    order_dishes.each { |dish| return false unless menu_dishes.include?(dish) }
    return true
  end

  def check_total
    true
  end
end
