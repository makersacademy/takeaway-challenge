require_relative 'menu.rb'

class Takeaway

def initialize(menu = Menu.new)
  @menu = menu
end

def list_menu
  @menu.menu_list
end

end