class Takeaway
  def initialize(menu_instance)
    @menu_instance = menu_instance
  end

  def print_menu
    output = ""
    @menu_instance.dishes.each do |dish|
      output += "#{dish[:name]}: #{dish[:price]}" + "\n"
    end
    return output
  end

end
