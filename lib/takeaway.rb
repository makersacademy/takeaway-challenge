require "./lib/menu.rb"
class Takeaway
include Menu

    attr_reader :menu

    def initialize
      @menu = Menu::BURGERS
    end

end





