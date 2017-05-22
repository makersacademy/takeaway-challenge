require_relative 'menu'

class Order

  attr_reader :new_order

    def initialize(menu)
      @new_order = []
    end

    def choose_item(menu_item)
      @new_order << menu_item
    end
end
