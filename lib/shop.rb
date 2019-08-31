class Shop

attr_reader :menu

def initialize(menu:)
  @menu = menu
end

def view_menu
  menu.view
end

end
