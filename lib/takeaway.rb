class Takeaway
  attr_reader :menu, :order, :total

  def initialize
    @menu = {
      fish: 5.00,
      scampi: 5.50,
      chips: 1.50,
      gravy: 2.00 
    }
    @order = []
    @total = 0
  end

  def show_menu
    @menu.each { |meal, price| puts "-- #{meal} : £#{price} --" }
  end

  def add_item(meal, quantity = 1)
    quantity.times { @order << meal }
    quantity.times { @total += @menu[meal.to_sym] }
  end

end
