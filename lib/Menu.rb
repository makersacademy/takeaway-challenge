class Menu

  attr_accessor :food, :prices

  def initialize
    @food = ['chicken', 'lamb', 'beef']
    @prices = { "chicken" => 7, "lamb" => 10, "beef" => 12 }
  end

  def item_list(item)
    @food = food [item]
  end


  def price_finder(item)
    @price = @prices[item]
  end




end
