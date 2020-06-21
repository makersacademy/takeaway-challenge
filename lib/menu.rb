class Menu
  attr_reader :list
  
  def initialize(food)
    @list = {}
    food.each do |dish, price|
      @list.store(dish, price)
    end
  end

end