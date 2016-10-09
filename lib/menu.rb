require_relative 'dish'

class Menu

  attr_reader :list

  def initialize(dish = Dish)
    @list = [ dish.new("Chicken Teriyaki", 6.95),
              dish.new("Salmon Teriyaki", 7.95),
              dish.new("Chicken Karaage", 4.95),
              dish.new("Pork Karaage", 4.95),
              dish.new("Chicken Katsu Curry", 7.95),
              dish.new("Yellow Tail Sashimi", 5.95),
              dish.new("Salmon Sashimi", 5.95),
              dish.new("Tuni Sashimi", 5.95),
              dish.new("Cucumber Maki", 1.95),
              dish.new("Miso Soup", 1.50),
              dish.new("Boiled Rice", 1.95),
              dish.new("Asahi", 3.75),
              dish.new("Hot Sake", 5.75)
            ]
  end
end
