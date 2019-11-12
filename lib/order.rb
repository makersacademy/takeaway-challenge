require './lib/menu.rb'

class Order
  attr_reader :order_list, :status

  def initialize(menu) #Pass the correct Menu as argument
    @menu = menu
    @order_list = [] #Array containing sets of [item, quantity]
    @status  = "not placed"
  end

  # Adds the menu item and quantity to the order
  def add_item(item, quantity)
    raise "Item not on menu" if on_menu?(item) == false
    @order_list << [item, quantity]
  end

  # Checks that an item added to an order is actually on the menu
  def on_menu?(item)
    names_list = []
    @menu.item_list.each do |item|
      names_list << item.name
    end
    names_list.include?(item)
  end

  # Takes the name of an item in the menu and returns its price
  def item_cost(order_item)
    item_address = nil
    n = 0
    # run through the list of Items in the menu and find the
    # address of the item matching the order_item argument
    @menu.item_list.each do |item|
      item_address = n if item.name == order_item
      n += 1
    end
    raise "Item not found" if item_address == nil
    # Pull the price from the item in the address matched above
    matched_item = @menu.item_list[item_address]
    matched_item.price
  end

  # order_total - returns the total for the order
  def order_total
    line_total = 0.to_f
    grand_total = 0.to_f
    @order_list.each do |item|
      line_total = item_cost(item[0]) * item[1]
      grand_total += line_total
    end
    grand_total.to_f.round(2)
  end

    # Return a delivery time 1 hour from now
  def delivery_time
    timestring = '%02d' % (Time.now.hour + 1) +
      ":" + '%02d' % Time.now.min
    timestring
  end

  # place_order(total) - 'pays' for the order and places it,
  # if the total is correct.
  def place_order(total)
    raise "Incorrect total passed" if total != order_total
    @status = "Placed"
    "Order placed. Delivery time is #{delivery_time}"
  end

  # Invokes the text messaging API
end
