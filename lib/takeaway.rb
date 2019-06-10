class Takeaway
  attr_reader :menu
  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    @menu.print
  end

end

# attr_reader :dishes
# DISHES = {
#   chicken: 15.00,
#   steak: 18.00,
#   donner: 8.00,
# }
# def initialize(dishes = DISHES)
#   @dishes = DISHES
# end
# def print_menu
#   DISHES
# end
