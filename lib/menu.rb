require_relative 'dishes'
require_relative 'order'

class Menu

  attr_reader :dishes

  def initialize(dishes = Dishes.new)
    @dishes = dishes
  end

  def indian
    @dishes.indian
  end

  def chinese
    @dishes.chinese
  end

  def italian
    @dishes.italian
  end

  def drinks
    @dishes.drinks
  end

end
