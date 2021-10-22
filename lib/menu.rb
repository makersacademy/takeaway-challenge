require 'dish'

class Menu
  attr_reader :dishes
  DEFAULT_LIST = [Dish.new("Spaghetti", 12), Dish.new("Maccaroni", 9)].freeze

  def initialize(dishes = DEFAULT_LIST)
    @dishes = dishes
  end

  def display_dishes
    raise "empty menu" if dishes == []
    response = ""
    @dishes.each do |dish|
      response += build_line(dish)
    end
    puts response
    response
  end

  private def build_line(dish)
    "#{dish.description}:#{dish.price}\n"
  end
end
