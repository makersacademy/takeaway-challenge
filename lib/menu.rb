class Menu
    attr_reader :menu

    def initialize(items)
        @menu = items
    end


    def print_menu
      menu = @menu.map do |item, price|
        "#{item} £#{price}"
      end
      menu.join(", ")
    end

    def item_included?(item)
      @menu.include?(item)
    end

    def price(item)
      @menu[item]
    end
end
