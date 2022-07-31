class Takeaway
  
  def initialize(menu)
    @menu = menu
  end

  def show_menu
    @menu.dishes
  end

  # def add_item_to_cart(item_number, quantity)
  #   chosen_item = @menu.select_item(item_number)
  #   @cart.add_item
  # end
end
