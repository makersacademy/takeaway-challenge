# The TakeawayOrder class
class TakeawayOrder
  attr_reader :list_of_dishes, :current_order_cost, :stored_menu

  def initialize(stored_menu)
    @list_of_dishes = {}
    @stored_menu = stored_menu
    @current_order_cost = 0
  end
end
