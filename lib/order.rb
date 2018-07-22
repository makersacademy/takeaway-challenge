require_relative 'menu'

class Order
  attr_reader :selections
  attr_reader :prices

  def initialize(menu = Menu.new)
    @menu = menu
    @selections = []
    @cost = 0
  end

  def print_menu
    @menu.menu
  end

  def select(selection)
    raise "#{selection} is not on the menu" if @menu.menu[selection].nil?
    @selections << selection
    @cost += @menu.menu[selection]
  end

  def remove(selection)
    raise "#{selection} was not previously selected" if @selections.include?(selection) == false
    @selections.delete(selection)
    @cost -= @menu.menu[selection]
    end

  def view_selections
    raise 'No items have been selected' if @selections.length.zero?
    @selections
  end

  def view_cost
    @cost.round(2)
  end
end
