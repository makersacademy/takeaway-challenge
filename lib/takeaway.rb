class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = { Cheeseburger: 5, Fries: 3, Milkshake: 2.99  }
    @order = Hash.new(0)
  end

  def show_menu
    @menu.map do | dish, price |
     "%s £%.2f" % [dish, price]
   end.join(", ")
  end

  def add(dish, quantity)
    @order[dish] += quantity 
  end

  def total
   calculate_total
 end

private

def calculate_total
  @total = 0
  @order.each {|key, value| @total += value * @menu[key] }
end


end
