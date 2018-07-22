class Menu
  attr_reader :food
  
  def initialize(food)
    @food = food
  end

  def show
    food.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ") # got this from the exemplar video
  end
end

#   @food = [
  #     {"item1" => 2.50},
  #     {"item2" => 2.80},
  #     {"item3" => 5.00},
  #     {"item4" => 3.00},
  #     {"item5" => 8.00},
  #     {"item6" => 6.30},
  #     {"item7" => 7.00}
  #   ]
  # end
