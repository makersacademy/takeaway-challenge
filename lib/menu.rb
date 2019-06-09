class Menu  
  DISHES = {
          "jollof rice": 6,
          "fried plantain": 3,
          "jerk chicken": 8,
          "vegetable patty": 4.5,
          "ice cream": 4
        }

  def print_menu
    format_menu
  end

  private

  def format_menu
    DISHES.map do |item, price|
      "#{item.to_s.capitalize}: £#{'%.2f' % price}"      
    end.join(", ")
  end
end
