class Menu
  attr_reader :menu
  alias_method :list, :menu

  def initialize(menu_hsh = {})
    if menu_hsh.empty? || !menu_hsh.instance_of?(Hash)
      fail 'Invalid Input, Try Initializing Menu with Hash'
    end
    @menu = menu_hsh
  end

  def add_to_order item, order
    fail 'Invalid Dish, Available Dishes in the Menu' unless valid_item?(item)
    order.add(item)
  end

  private

  def valid_item?(item)
    menu.include?(item)
  end
end
