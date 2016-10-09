require_relative 'menu'

class Order

  attr_reader :basket

    def initialize(menu = Menu.new)
      @menu = menu
      @basket = Hash.new(0)
      @total = 0
    end

    def show_menu
      @menu
    end

    def add_to_basket(item, num = 1)
      @menu.valid_item(item)
      @basket[item] += num
    end

    def calculate_total
      @basket.each do |item, num|
        @total += (num * @menu.price(item))
      end
      @total
    end
end
