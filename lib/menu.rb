class Menu

  attr_reader :menu, :order, :dish

  def initialize
    @menu = {"Pepperoni" => 8, "Meat Feast" => 10, "Chicken" => 7}
    @order = []
    @dish = dish
  end

  def show_menu
    menu
  end

  def place_order(dish)
    if @menu.has_key?(dish)
      @order << dish
    else raise "Sorry, this dish is not on the menu."
    end
  end



end
