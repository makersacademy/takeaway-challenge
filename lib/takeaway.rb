require './lib/dish'

class Takeaway
  attr_reader :menu_list
  
  def initialize
    @menu_list = [
      # Dish.new('Pizza', 10),
      # Dish.new('Steak', 50),
      # Dish.new('Olives', 3)
    ]
  end

  def show_menu
    menu = []
    @menu_list.each { |dish|
      menu << "#{dish.name} - #{dish.price}"
    }
    menu.join(', ')
  end

end

# As a customer
# So that I can check if I want to order something
# I would like to see a **list** of **dishes** with **prices**