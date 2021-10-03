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

  # def add_item(item)
  #   if menu.key?(item)
  #     @basket.push(item)
  #     cost = @menu.fetch(item)
  #     @total += cost
  #   else 
  #     return "This is not a menu item"
  #   end
  # end

  def remove_item(item)
    if basket.include?(item) == false
      return "this item is not in your basket"
    else
      cost = @menu.fetch(item)
      @total -= cost
      basket.delete_at(basket.find_index(item))

    end
  end
end

mc_donalds = Takeaway.new

#classes 
# Customer : basket, add_item, remove_item, deliver
# Resturant : menu, add_dish, remove_dish