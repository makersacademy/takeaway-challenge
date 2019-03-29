describe "Takeaway features" do
  skip "has this expected behaviour" do
    menu.list #handle the menu printing and prices of dishes
    order.new #we make a new order
    order.add_to_order(number or name of dish, quantity = 1)
    order.check_order
    order.remove_from_order(number or name of dish, quantity = 1)
    order.check_order
    order.place_order
    # recieve text message
  end
