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
        charge = quantity_i * item[:price]
        line_item = { :ref => item[:ref], :name => item[:name], :charge => charge }
        @basket << line_item
      end
    end
    return @basket
  end

  def total
    total_charge = 0
    @basket.each do | item |
      total_charge += item[:charge]
    end
    return total_charge
  end


end
