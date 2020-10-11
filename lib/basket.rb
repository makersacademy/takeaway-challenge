require_relative 'menu'

class Basket

    def initialize
      @basket = []
    end

    def basket
      @basket
    end

    def order(item)
      @basket << item
    end

end