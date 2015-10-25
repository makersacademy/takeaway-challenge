require_relative 'menu'

class Takeaway

    attr_reader :menu, :total

  def initialize(menu_klass = Menu.new)
    @menu = menu_klass
  end

  def add(food, quantity = 1)
    @menu.add(food, quantity)
  end

  def request_menu
    @menu.view_menu
  end

  def confirm_total(total)
    total == @menu.total
  end
end