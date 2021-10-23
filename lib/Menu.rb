class Takeaway

  attr_reader :food, :prices
  attr_accessor :basket

  def initialize
    @food = ['chicken', 'lamb', 'beef']
    @prices = { "chicken" => 7, "lamb" => 10, "beef" => 12 }
    @basket = []
  end

  def menu
  @prices
  end

  def item_list(food_array_number) # pointless method atm,  Kept for later potential uses
    @food = food[food_array_number]
  end

  def price_finder(item_name)
    @prices[item_name]
  end

  def order(food_name)
    @basket << food_name
  end

end
