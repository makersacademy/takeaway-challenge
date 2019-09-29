# restaurant.rb
class Restaurant

  def initialize
    @menu = []
  end

  def add_dish(dish)
    @menu << dish
  end

  def menu
    return "Unavailable" if @menu.empty?
    @menu.collect do |dish|
      "#{dish.name}: #{"%.2f" % dish.price}"
    end
  end

end
