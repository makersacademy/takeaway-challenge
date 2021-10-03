class Takeaway
   attr_reader :menu
   attr_reader :basket
   attr_reader:total
  def initialize
    @menu = {
      "burger" => 5.00,
      "chips" => 2.00,
      "coke" => 1.00
    }
    @basket = []
    @total = 0
  end

  def list_menu 
    @menu
  end

  def add_dish(dish , price)
    @menu[dish] = price
  end

  def remove_dish(dish)
    if @menu.has_key?(dish) == true
      @menu.delete(dish)
    else
      return "this dish does not exist"
    end
  end
  def basket_price
    @total
  end

end



#classes 
# Customer : basket, add_item, remove_item, deliver
# Resturant : menu, add_dish, remove_dish