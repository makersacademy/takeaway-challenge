describe "Takeaway features" do
  skip "has this expected behaviour" do
    menu = Menu.new
    menu.list # handle the menu printing and prices of dishes
    order.new(menu) # we make a new order
    order.add_to_order(2)
    order.check_order
    order.remove_from_order(2)
    order.check_order
    order.place_order
    # recieve text message
  end
  skip "Menu features" do
    menu = Menu.new # add from file?
    menu.list
  end
end
