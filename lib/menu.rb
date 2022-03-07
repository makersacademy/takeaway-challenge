require_relative 'dish'

class Menu

  attr_accessor :menu

  def initialize
    pizza = Dish.new('pizza', 15)
    bean_chilli = Dish.new('bean chilli', 12)
    paneer_tikka_masala = Dish.new('paneer tikka masala', 10)
    @menu = [pizza, bean_chilli, paneer_tikka_masala] 
    #requires hard coded dishes for order class to not need to input into menu before use
    #order class to eventually take pre made menus, where hard coding is no longer needed
  end

  def add_dish(name, price)
    menu << Dish.new(name, price)
  end

  def remove_dish(name)
    @menu.delete_if { |dish| dish.name == name}
  end

  def print_menu
    @menu.each { |dish| puts "#{dish.name} - £#{dish.price}"}
  end
end