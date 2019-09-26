# restaurant.rb
class Restaurant

  def initialize()
    @menu =[]
  end
  def add_dish(dish)
    @menu << dish
  end
  def menu
    @menu.collect { |dish|
      "#{dish.name}: #{dish.price}"
    }
  end
end
