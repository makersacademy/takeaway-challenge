class Order

attr_reader :menu

  def menu
    @menu = {
      Cheeseburger: "£8.50",
      Fries: "£3.75"
    }
  end

  def print_menu
    printed_menu = menu
    menu.each {|key, value| puts "#{key}: #{value}\n" }
  end

end
