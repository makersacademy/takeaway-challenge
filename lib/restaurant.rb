require_relative 'list'
require_relative 'waiter'

class Restaurant

  def initialize(menu = "takeawaylist.csv")
    @menu = List.new(menu)
    @waiter = Waiter.new(self)
  end

  def view_menu
    menu.print_menu
  end

  def place_order(order)
    waiter.select_items(order)
  end


  private

  attr_reader :menu, :waiter

end
