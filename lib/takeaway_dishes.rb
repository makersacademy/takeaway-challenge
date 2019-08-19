class Dishes

  attr_reader :dishes, :checkout, :price, :food_order

  def initialize
    @dishes = [
              { item: "korma", price: 3.80 },
              { item: "egg fried rice", price: 2.00 },
              { item: "plain naan", price: 1.50 },
              { item: "chicken tikka", price: 4.00 },
              { item: "special fried rice", price: 2.80 },
              { item: "chips", price: 1.00 },
              { item: "sushi", price: 16.50 }
       ]
    @food_order = []
  end

  def select_dishes(item)
    dishes.each { |element|
      if element[:item] == item
        return element
      end
    }
  end

  def display_price(item)
    dishes.each { |element|
      if element[:item] == item
        return element[:price]
      end
    }
  end

  def check_out(item)
    # @checkout << select_dishes(item)
    # return checkout
    dishes.each { |element|
      if element[:item] == item
        @food_order << element[:item]
      end
    }
    # total = 0
    # dishes.each { |element|
    #   if element[:item] == item
    #     return element[:price]
    #   end
    # }
    # total += element ["price"]
        # @food_order = element
        # @checkout << @food_order
        # return @checkout
        # element[:item] == item
        # return element[price]
        # @price << element[:price]
  end

end
