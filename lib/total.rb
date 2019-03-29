require_relative 'food_menu'

class TotalCost

  def initialize
    @fm = FoodMenu.new
    @show_cost = []
    @total_cost = 0
  end

  def calc(order)
    @show_cost = []
    order.each do |y|
      @show_cost << "#{@fm.get_name(y[:food])} x #{y[:quantity]} = £#{(y[:quantity].to_i * @fm.pricing(y[:food]))}"
      @total_cost += (y[:quantity].to_i * @fm.pricing(y[:food]))
    end
    return "#{@show_cost.join(",\n")}. \nTotal Cost = #{@total_cost}"
  end

  def total_cost
    @total_cost
  end

end
