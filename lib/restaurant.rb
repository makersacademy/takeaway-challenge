require './lib/menu'

class Restaurant

  attr_reader :takeaway_menu

  def initialize(menu = Menu.new)
    @takeaway_menu = menu
  end

  def print_takeaway_menu
    add_takeaway_menu
    @takeaway_menu.print_list
  end

  private

  def add_takeaway_menu
    @takeaway_menu.add_dish("Vongole", 14.25)
    @takeaway_menu.add_dish("Lasagne", 12.60)
    @takeaway_menu.add_dish("Margherita", 8.95)
    @takeaway_menu.add_dish("Vegetariana", 12.95)
    @takeaway_menu.add_dish("Tiramisu", 5.95)
    @takeaway_menu.add_dish("Prosecco", 7.00)
  end

end
