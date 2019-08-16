class Dishes

  attr_reader :dishes

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
end
