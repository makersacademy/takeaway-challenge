class Restaurant
  def initialize()
    @dishes = {pasta: 7.99, salad: 3.99, roast: 14.99, soup: 4.99}
  end

  def show_menu
    @dishes
  end
end
