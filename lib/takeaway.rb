class Takeaway

  def initilize
    @menu_list = []
  end

  def c_menu
    @menu_list = {rice: 1.90, noodles: 2.50, fried_rice: 2.20, kung_po_chicken: 4.50, chicken_curry: 5.10, beef_in_black_bean_sauce: 6.50}
  end

  def l_menu
    # fail "No menu items" if @menu_list.length == 0
    @menu_list
  end

end
