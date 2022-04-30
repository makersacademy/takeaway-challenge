

class Takeaway

  attr_reader :menu

  def initialize
    @menu = [{ item: "Guinness", price: 6.00, available: true },
    { item: "Espresso Martini", price: 12.50, available: true },
    { item: "Ruddles", price: 1.99, available: true },
    { item: "Huel", price: 3.00, available: false }]
  end 

  def see_menu
    menu_items
  end

  def menu_items
    ["#{@menu[0][:item]}" + " £#{@menu[0][:price]}",
    "#{@menu[1][:item]}" + " £#{@menu[1][:price]}",
    "#{@menu[2][:item]}" + " £#{@menu[2][:price]}",
    "#{@menu[3][:item]}" + " £#{@menu[3][:price]}"]
  end
end

# @menu.each do |dish|
#   dish.each do |key,value|
#     (key.to_s + ': ' + value.to_s)
#   end
