require_relative 'menu'
require_relative 'takeaway'

class Basket

  attr_reader :available_items, :selected_items

  def initialize(menu)
    @available_items = menu
    @selected_items = []
  end

  def add_item(item_num)
    select_dish(item_num)
  end

  private

  def select_dish(item_num)
    @available_items.each.with_index(1) do | item, index|
      raise dish_not_available if item_num < 1 || item_num > available_items.length
      if item_num == index
        @selected_items.push(item)
      end
    end
  end

  def dish_not_available
      "Cannot select this dish: this dish is not available"
  end

end
