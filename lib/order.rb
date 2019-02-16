class Order

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end



  # def select_dish(dish, quantity = 1)
  #
  # end

end
