require 'csv'

class Menu

  def initialize(menu_list = 'lib/takeaway_menu.csv')
    @display_menu = {}
    menu_load(menu_list)
  end

  def display_menu
    @display_menu
  end

  def menu_load(menu_list)
    CSV.foreach(menu_list) do |row|
      item, cost = row[0], row[1]
      menu_add(item, cost)
    end
  end

  def menu_add(item, cost)
    @display_menu[item] = cost
  end

end
