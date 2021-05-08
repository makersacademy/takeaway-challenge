require_relative 'menu.rb'

class Restaurant
  attr_reader :menu
  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def show_menu
    menu.list
  end

  def order(dish, portions = 1)
    if @basket.include? dish
      @basket[dish] += portions
    else @basket.store(dish, portions)
    end
    return "#{portions} portion/s of #{dish} added to your basket"
  end

  def basket_summary
    # code to calculate subtotal for each dish/portion pair in basket
    arr = []
    basket.each do |dish, portions|
      arr << "#{portions} portions of #{dish}: £#{"%.2f" % (portions * menu.list[dish])}, "
    end
    arr.join.chomp(", ")
  end

end
