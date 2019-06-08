

class Menu

  attr_reader :food, :selection

  def initialize
    @selection = {}
    @food = [
      { item: "Big Mac", price: 5.99 },
      { item: "Cheese Burger", price: 3.99 },
      { item: "Chicken Legend", price: 4.99 },
      { item: "Nuggets", price: 2.99 },
      { item: "Fries", price: 0.99 },
      { item: "Coke", price:  0.99 },
      { item: "Milk Shake", price: 1.99 },
    ]
  end

  def show
    @food.each { |item| puts "* #{item[:item]} - £#{item[:price]}"
    }
  end

  def choose_items(select, quantity)
    @food.each do |item|
      if select == item[:item]
        @selection = { item: item[:item],
          price: item[:price], quantity: quantity }
      end
    end
    @selection
  end
end
