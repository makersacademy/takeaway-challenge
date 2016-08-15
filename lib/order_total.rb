class OrderTotal

  attr_accessor :total_cost

  def initialize
    @total_cost = 0
  end

  def cost(order)
    order.each {|item|
      item.each {|food,quantity|
        food.each {|food, cost|
        add_to_total_cost(cost, quantity)
      }
      }
    }
    check_total_cost
  end

  private

  def add_to_total_cost(cost, quantity)
      self.total_cost += (cost * quantity)
  end

  def check_total_cost
    self.total_cost
  end



end
