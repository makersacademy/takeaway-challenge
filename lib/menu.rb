class Menu

  

  def initialize
    @menu = []
  end

  def check(dish,price)
    @dish = {:dish => dish}
    @price = {:price => price}
    @menu << @dish.merge(@price)
    @menu
  end
end
