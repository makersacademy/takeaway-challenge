require "dish"

class Takeaway
  attr_reader :cust_order, :dishes

  def initialize
    @dishes = [
      Dish.new("Pizza", 5.20),
      Dish.new("Kebab", 3.00),
      Dish.new("Chips", 1.00),
      Dish.new("Drink", 0.80),
    ]
  end

  def view_menu
    dishes.each do |dish|
      puts "#{dish.name}" + " £" + ('%.2f' % dish.price).to_s
    end
  end

  def order(selection)
    @cust_order = []
    @dishes.each do |dish|
      if dish.name == selection
        @cust_order << ("#{dish.name}" + " £" + ('%.2f' % dish.price).to_s)
      end
    end
  end
end
