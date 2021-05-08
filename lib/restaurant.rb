require_relative 'menu.rb'

class Restaurant
  attr_reader :menu
  attr_reader :basket

  def initialize(menu)
    @menu = menu
    @basket = {}
  end

  def show_menu
    menu.list
  end

  def order(dish, portions = 1)
    fail "Sorry, #{dish} aren't on the menu" unless menu.list.include?(dish)
    
    if @basket.include? dish
      @basket[dish] += portions
    else @basket.store(dish, portions)
    end
    return "#{portions} portion/s of #{dish} added to your basket"
  end

  def basket_summary
    arr = []
    basket.each do |dish, portions|
      arr << "#{portions} portions of #{dish} @ £#{"%.2f" % menu.list[dish]} each = £#{"%.2f" % (portions * menu.list[dish])}, "
    end
    arr.join.chomp(", ")
  end

  def total
    count = 0
    basket.each do |dish, portions|
      count += (portions * menu.list[dish])
    end
    "Total owing: £#{"%.2f" % count}"
  end

end
