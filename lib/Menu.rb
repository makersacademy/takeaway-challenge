class Menu

  def initialize
    @menu = []
  end

  def menu_add(dish)
    @menu << dish
  end

  def menu
    @menu.each { |dish| puts "#{dish} - £#{dish.price}"}
  end

end
