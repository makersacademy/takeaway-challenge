class Customer

  def see_menu(restaurant)
    output = ""
    restaurant.menu.each do |dish, price|
      output += "#{dish} are £#{price}\n"
    end
    output
  end

end
