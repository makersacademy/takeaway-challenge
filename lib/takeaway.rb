module TakeAway

  def interactive_menu
  end

  def print_top_level_menu
  end

  def process_top_level_menu(selection)
    case selection
    when "0" then print_restaurant_menu
    when "1" then make_order
    when "2" then puts order_summary
    when "3" then start_checkout
    when "9" then exit
    end
  end

  def print_restaurant_menu
  end

  def make_order
  end

  def start_checkout
  end

end
