class Menu

attr_reader :list
DEFAULT_MENU = { pizza: 8, pasta: 7, soup: 5, bread: 2 }

def initialize (menu=DEFAULT_MENU)
  @list = menu
end

end
