require 'menu'

class Order
  def initialize(menu)
    @basket = []
    @menu = menu.menu
  end

  def select(item_reference, quantity)
    quantity_i = quantity.to_i
    @menu.each do | item |
      if item[:ref] == item_reference
        return item_reference
      end
    end
  end
end
