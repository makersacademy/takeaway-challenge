class TakeAway

attr_reader :menu


def initialize(menu: menu)
  @menu = menu
end

def print_menu
menu.print_this
end




end
