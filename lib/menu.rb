class Menu

  attr_reader :menu

  def initialize
    @menu = []
  end

  def add_dish(name, price)
    @menu << {name => price}
  end 

  # def remove_dish(name)
  #   @menu.delete(name)
  # end
end
