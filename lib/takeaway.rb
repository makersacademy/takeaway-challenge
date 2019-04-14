require 'selection'

class Takeaway

  def initialize(menu: menu, selection: nil)
    @menu = menu 
    @selection = selection || Selection.new(menu)
  end

  def print_menu
    menu.print 
  end

  def select_dishes(dishes)
    dishes.each { | dish, number_of_dish |
      selection.add(dish, number_of_dish)
    }
<<<<<<< HEAD
    selection.total
=======
>>>>>>> 3e3a9aa6a5ad2fbd5599a0587e75847e5c2151e5
  end

  private 

  

  attr_reader :menu, :selection
end