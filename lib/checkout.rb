
class Checkout

  attr_accessor :order, :meal

  def show_order(meal)
    print "You have selected #{meal.length} dishes: "
    print_order(meal)
    calculate_total(meal)
  end

  private

  def print_order(meal)
    print "#{meal.map {|meals| puts "#{meals[:dish]} at £#{meals[:price] }" }}."
  end

  def calculate_total(meal)
    print "This gives you a total price of £#{(sprintf "%.2f", (meal.map {|meals| meals[:price]}.inject(0, :+)))}"
  end
end
