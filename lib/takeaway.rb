require_relative 'menu.rb'

class Takeaway
  attr_reader :cart

  def initialize
    @cart = {}
  end

  def show_menu
    menu_person = Menu.new
    menu_person.food_list
    @menu = menu_person.food_list
  end

  def select(food, quantity)
    @cart[food] = quantity
    p "#{food} added to your cart!"
  end
end
