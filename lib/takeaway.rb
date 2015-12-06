class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = { Cheeseburger: 5, Fries: 3, Milkshake: 2.99  }
    @order = Hash.new(0)
    @place_order = nil
  end

  def show_menu
    @menu.map do | dish, price |
     "%s £%.2f" % [dish, price]
   end.join(", ")
  end

  def add(dish, quantity)
    @order[dish] += quantity
  end



end
