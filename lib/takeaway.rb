require_relative 'print_menu'

class Takeaway

  def initialize(print_menu_class = PrintMenu)
    @print_menu_class = print_menu_class
  end

  def see_menu
    @print_menu_class.new.see_menu_list
  end

  def order(dish, quantity)


  end

end
