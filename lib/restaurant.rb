require_relative 'place_order'
require_relative 'text'
class Restaurant
attr_reader :menu
#factory pattern
#service objects

MENU = {"chicken"=>10,
        "steak"=>20,
        "burger"=>12,
        "pizza"=>5}

    def initialize(menu = MENU, text_klass: Text.new)
       @menu = menu
       @text = text_klass
    end

    def checkout(order)
      p "Your receipt is: #{order}"
      @text.messege
    end

end
