require_relative 'menu'

class Takeaway
  def initialize(menu = Menu.new)
    @menu = menu
  end 

  def show_menu
    @menu.display
  end

  def select_dish(dish)
    # fail 'The dish is not in the menu' unless in_menu?(dish)
  end

  # def in_menu?(item)
  #   p @menu.items
  #   @menu.items.include?(item)
  # end

end

# takeaway = Takeaway.new()

# p takeaway

# p takeaway.select_dish(:pita)

# p takeaway.in_menu?(:pita)
