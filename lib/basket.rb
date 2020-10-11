require_relative 'menu'

class Basket

    def initialize
      @basket = []
      @order_total = 0
    end

    def basket
      @basket
    end

    def order_total
      @order_total
    end

    def order(item)
      @basket << item
    end

end