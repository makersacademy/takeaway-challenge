class FoodOrder
  attr_accessor :basket, :takeaway_menu

  def initialize(takeaway_menu = Menu.new)
    @basket = []
    @takeaway_menu = takeaway_menu
  end

  def add_dish(dish)
    selection = takeaway_menu.menu.select { |key, _value| key == dish.to_sym }
    basket << selection
  end

  def total
    sum = 0
    basket.each { |item| item.each_value { |cost| sum += cost } }
    sum
  end

  def correct_total?(price)
    total == price
  end
end
