class Takeaway
  attr_reader :dishes, :basket
  def initialize
    @dishes = { "Mango" => 2, "Burger" => 3, "Chips" => 2, "Croissant" => 12 }
    @basket = []
  end
  
  def list
     puts @dishes.map {|k, v| "#{k} costs #{v}" }.join("\n")
  end

  def choose(item)
    fail 'Not available' if item == 
    @selected_dishes = @dishes.select { |k, v| k == (item) }
    @basket.push(item)
  end
end
# class Basket

  # def choose
  #  @dishes.select { |choose, price| choose() = price }
  # end