class Order 
  
  attr_reader :dishes
  
  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, amount)
    fail "#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish)
    dishes[dish] = amount
  end

  def total
    item_totals.inject(:+)
  end

  private

  attr_reader :menu
  
  def item_totals
    dishes.map do |dish, amount|
      menu.price(dish) * amount
    end
  end
end