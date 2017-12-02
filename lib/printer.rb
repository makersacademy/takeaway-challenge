class Printer

  def print_menu(menu = Restaurant.new.menu)
    pretty_print = "Takeaway Menu \n"
    for i in 0..menu.length-1
      pretty_print += "#{i+1}. #{menu[i][:dish]} £#{menu[i][:price]} \n"
    end
    pretty_print
  end

end
