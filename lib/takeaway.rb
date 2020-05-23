require_relative 'menu'
class Takeaway

attr_reader :current_menu

def initialize
@current_menu = Menu.new
end

def d_menu
    @current_menu.display_menu
    
end
    
end
