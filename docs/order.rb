require './docs/dishes.rb'
class Order

  def initialize(dishes = Dishes)
    @dishes = dishes
    @total = 0
    @order_summary = []
  end

  def select(dish)
    @dishes_class = @dishes.new
    @total += @dishes_class.price(dish)
    @order_summary.push("#{dish} = £#{@dishes_class.price(dish)}")
    "#{dish} has been added to your order"
  end

  def order_summary
    @order_summary.join(", ")
  end

  def total
    "£#{@total}"
  end

end
