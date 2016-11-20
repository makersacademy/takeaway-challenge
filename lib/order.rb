class Order

attr_reader :menu

  def menu
    @menu = {
      cheeseburger: "£8.50",
      fries: "£3.75"
    }
  end

  def print_menu
    menu.each {|key, value| puts "#{key}: #{value}" }
  end

  def select_dish(choice)
      "#{choice}: #{menu[choice.to_sym]}"
  end

end
