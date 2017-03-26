class TakeAway

  def initialize(menu:)
    @menu = menu
  end

  def read_menu
    menu.print
  end

private
attr_reader :menu
  # def food
  #   puts "What would you like to order?"
  #   @food = gets.chomp
  # end
  #
  # def order(food)
  #   selection = menu.fetch(food)
  #   order << food
  # end
  # {"Samosa" => 6.50, "Naan" => 2.50, "Poppadum and Chutney" => 2.50, "Dal Tarka" => 6.75, "Vegetable Jalfrezi" => 7.75, "Masala Dosa" => 7.95}

end
