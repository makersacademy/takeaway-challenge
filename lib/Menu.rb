class Menu

  attr_accessor :food, :prices

  def initialize
    @food = ['chicken', 'lamb', 'beef']
    @prices = { "chicken" => 7, "lamb" => 10, "beef" => 12 }
  end

  def item_list(food_array_number)
    @food = food[food_array_number]
  end


  def price_finder(item_name)
    @prices[item_name]
  end




end
