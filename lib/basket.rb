class Basket

  attr_reader :items

    def initialize
      @basket = []
    end

    def view
      @basket
    end

    def price
      # @price = @basket.inject(:+)
    end

    def order(item)
      @basket << item
    end

    # def order(item, quantity)
    #
    #   @price = items.fetch(item)
    #   @items[item]
    #   puts "Thank you for ordering #{quantity} x #{item}, costing £#{list_of_items.fetch(item)} each"
    #   @basket << [item, items.fetch(item),quantity]
    #   @subtotal << items.fetch(item)*quantity
    # end

end
