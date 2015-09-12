require_relative 'menu'

class Customer
  include Menu

  def check_menu
    menu
  end

  def select_dishes(dish, quantity)
  end
end
