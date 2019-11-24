class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def item(option)
    @dishes[option - 1].dish
  end

  def add_dishes(*listings)
    listings.each { |listing| @dishes.push listing }
  end
end
