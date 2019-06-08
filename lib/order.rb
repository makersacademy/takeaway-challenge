class Order

  attr_reader :dishes

  def initialize
    @dishes = []
  end
  
  def add_dishes(dish, quantity)
    @dishes << {:dish => dish, :qty => quantity}
  end

end