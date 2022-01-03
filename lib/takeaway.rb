class Takeaway
    attr_reader :menu_items
    def initialize
        @menu_items = []
    end
    def print_menu
        menu = []
        @menu_items.each { |dish|
          menu << "#{dish.name} : #{dish.price}"
        }
        menu.join(' / ')
      end
end