
class Takeaway

  attr_reader :menu, :dishes, :item, :cost, :prices, :total

  def initialize
    @menu = {}
    @dishes = []
    @prices = []
    @total = total
    @item = item
    @cost = cost
  end

  def menu
    @menu = {
      "dish" => 2.50
    }
  end

  def select_item(dish, quantity)
    @item = @menu.key(2.50)
    @cost = @menu["dish"]
    quantity.times do
      @dishes << @item
      @prices << @cost
    end
  end

  def get_total_cost
    @total = @prices.reduce(0){|sum,num| sum + num }
  end

  def sum_correct?
    @total == @prices.reduce(0){|sum,num| sum + num } ? true : false
  end

  def print_order
    fail 'Incorrect total' if !sum_correct?
    "You have ordered: #{@dishes}. Total cost is: £#{@total}."
  end

end
