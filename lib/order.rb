require_relative 'menu'

class Order

  def initialize(menu: Menu.new)
    @summary = {}
    @menu = menu
  end

  def add item
    @summary[@menu.dishes[item]].nil? ? @summary[@menu.dishes[item]] = 1 : @summary[@menu.dishes[item]] += 1
  end

  def summary
    @summary.dup
  end

  def from_menu
    @menu.display
  end
end
