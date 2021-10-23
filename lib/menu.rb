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
    @dishes.each_index do |index|
      response += build_line(index)
    end
    response
  end

  private def build_line(index)
    "#{index + 1} #{@dishes[index].description}:#{@dishes[index].price}\n"
  end
end
