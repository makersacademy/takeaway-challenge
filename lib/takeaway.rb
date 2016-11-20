#takeaway is like the restaurant. It should allow customers see a list of dishes and prices from the menu.

require_relative 'menu.rb'
require_relative 'order.rb'

class Takeaway

    attr_accessor :menu

    def initialize(klass)
      @menu = klass.new.menu_list
    end

end
