require 'menu'

class Order

  attr_reader :menu, :meal

  def initialize(menu)
    @menu = menu
    @meal = []
  end

  def select_dish(selection)
    if selection.respond_to?(:even?)
      @meal << @menu.dishes[selection - 1]
    else
      @menu.dishes.each { |dish| @meal << dish if dish.name.downcase == selection.downcase }
    end
  end

end
