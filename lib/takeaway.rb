class Takeaway

attr_reader :menu , :basket

def initialize
  @menu = {"Pizza"=> 6, "Curry"=> 4, "Chips"=> 2}
  @basket = {}

end

  def order(dish)
    # @menu.has_key?(dish)
    raise not_on_menu_msg if !@menu.has_key?(dish)
    dish
    # p "yes"
    # @basket << dish
    # p @basket
  end

  def not_on_menu_msg
    "Not on the menu, please try again"
  end

end
