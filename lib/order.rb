class Order

    attr_reader :selection, :menu

    def initialize(menu = Menu.new)
        @selection = {}
        @menu = menu
    end

    def add(dish, quantity)
        selection[dish] = quantity
    end

    def total
        item_totals.inject(:+)
    end

    private

    def item_totals
        selection.map do |dish, quantity|
          menu.price(dish) * quantity
        end
      end
end