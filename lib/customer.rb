class Customer

  def view_menu
    menu =
    [
      { dish: 'Burger', price: 5 },
      { dish: 'Fries',  price: 4 },
      { dish: 'Milkshake', price: 3 },
      { dish: 'Onion Rings', price: 2 },
      { dish: 'Hot Dog', price: 1 }
    ]
  end

  def menu_selection
    customer_selection = {}
    puts "What would you like to order?  When done type 'place order'"
    puts view_menu
    while true do
      customer_input = gets.chomp
      if customer_input == 'place order'
        display_order
      else
        customer_selection << customer_input
      end
    end
  end
end
