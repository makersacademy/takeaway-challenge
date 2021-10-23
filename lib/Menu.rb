class Takeaway

  attr_reader :food, :prices
  attr_accessor :basket, :basket_cost

  def initialize
    @food = ['chicken', 'lamb', 'beef']
    @prices = { "chicken" => 7, "lamb" => 10, "beef" => 12 }
    @basket = []
    @basket_cost = []
  end

  def menu
  @prices
  end

  def item_list(food_array_number) # pointless method atm,  Kept for later potential uses
    @food = food[food_array_number]
  end

  def price_finder(item_name) # Another pointless method atm. Kept for testing
    @prices[item_name]
  end

  def order(food_name)
    while true do
      if food_name == "chicken"
        @basket << food_name
        @basket_cost << @prices[food_name]
        break
      elsif food_name == "beef"
        @basket << food_name
        @basket_cost << @prices[food_name]
        break
      elsif food_name == "lamb"
        @basket << food_name
        @basket_cost << @prices[food_name]
        break
      else
        raise "not a valid input"
      end
    end
  end

end
