class Order

  MENU = {         "Chop Suey" => 7.00,
                     "Dim Sum" => 6.50,
              "Prawn Crackers" => 2.00,
              "Duck Chow Mein" => 7.50,
                  "Spare ribs" => 9.00,
             "Fortune Cookies" => 3.00 }

  def view_menu
   LIST_OF_ITEMS.to_s
  end

  def create(*item_quantity)
    total_cost = 0
    item_quantity.each do |item, quantity|
      total_cost += MENU[item]*quantity
    end
    total_cost
  end


end
