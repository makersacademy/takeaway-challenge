require 'yaml'

class Menu

  def initialize(menu_file = 'menu.yml')
    @menu = YAML::load(File.open('./lib/resources/'+menu_file))
  end

  def view
    "// MENU //"+print_menu
  end

  def find(dish_name)
    @menu.each do |section, dishes|
      dishes.each do |dish|
        @dish = dish if dish[:name] == dish_name
      end
    end
    @dish ? @dish : fail("Not in the menu!")
  end

  private

  def print_menu
    string = ""
    @menu.each do |section, dishes|
      string += " -- #{section.downcase} -- "
      dishes.each { |dish| string += " #{dish[:name]} £#{dish[:price]} /"}
    end
    string
  end

end
