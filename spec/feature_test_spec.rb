require './lib/takeaway'

describe 'Feature Tests' do

  # Create new takeaway
  dishes = {"Spag_Bol" => 6.5, "Pizza" => 4, "Chips" => 2.75}
  m = Menu.new(dishes)
  t = Takeaway.new(m, SMS)
  # View menu
  t.read_menu
  # Get ready to order some items
  t.create_order
  # Choose some items from the menu
  t.select_item("Pizza", 3)
  t.select_item("Chips")
  # Choose an item not from the menu
  t.select_item("Peas")
  # View basket
  t.order.view_basket
  # Confirm the order with the incorrect amount
  t.confirm_order(18.40)
  # Confirm the order with the correct amount
  t.confirm_order(14.75)
  # Get SMS


end
