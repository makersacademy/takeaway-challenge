class Takeaway

  MENU = [
    {:code => "CTM", :dish => "Chicken Tikka Masala", :price => 5}, 
    {:code => "PPD", :dish => "Popadoms", :price => 1}, 
    {:code => "PM", :dish => "Paneer Masala", :price => 3}, 
    {:code => "CK", :dish => "Chicken Korma", :price => 4}, 
    {:code => "LC", :dish => "Lamb Curry", :price => 5}
  ]


  def initialize
    @order_arr = []
  end

  def menu
    MENU
  end

  def print_menu(menu)

    menu.each {
      |sub_hash|
      puts "#{sub_hash[:code]}: #{sub_hash[:dish]} - £#{sub_hash[:price]}"
    }
  end

  def order(code, quantity = 1)
    @order_arr << {code => quantity}
  end


end