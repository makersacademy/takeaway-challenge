require_relative 'menu'

class Takeaway
  include Menu

  def initialize
    @final_order = []
    @hashed_order = {}
    @takeaway_menu = { "pizza" => 3, "curry" => 4, "chopsuey" => 2 }
  end

  attr_reader :final_order, :takeaway_menu, :hashed_order

  def order(dish, qty)
    fail 'That is not on the menu!' unless dish == "curry" or dish == "chopsuey" or dish == "pizza"
    final_order << [dish, qty]
    @hashed_order = Hash[*final_order.flatten(1)]
  end

  def cost
    hashed_order.my_inject(0) do | total_cost, order |
      order.each { | item, qty | total_cost = total_cost + @takeaway_menu[item] * qty }
      total_cost
    end
 end

end
