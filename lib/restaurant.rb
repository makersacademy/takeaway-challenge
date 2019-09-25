# restaurant.rb
class Restaurant
  attr_reader :menu
  def initialize
    @menu =[]
  end
  def add_dish(dish)
    menu << dish
  end
end
