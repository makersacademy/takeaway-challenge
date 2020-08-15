require_relative 'menu'
require_relative 'order'

class Takeaway
    attr_reader :menu
    
    def initialize(menu= Menu.new)
        @menu = menu
    end

    def pick
        @menu.view
        
       
    end
end
