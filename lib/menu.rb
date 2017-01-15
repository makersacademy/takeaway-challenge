
class Menu
  attr_reader :order, :dishes

  def initialize
    @dishes = Hash.new
    @dishes[:ratatouille] = 20
    @dishes[:eggs] = 5
    @order = Hash.new
  end

  def select_food(dish)
    if @dishes[dish] != nil
    #  @dishes.select { |k,v| k == dish }
      @order[dish]=@dishes[dish]
      dish
    else
      "we don't serve that, please select something from the menu"
    end
  end

   def price
     price = 0
     @order.each { |k,v| price += v }
     price
  end 

end
