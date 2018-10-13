module Menu

  DISHES = [{ "Large chips" => 2.45 },
    { "Small chips" => 2.00 },
    { "Cod" => 4.85 },
    { "Plaice" => 4.85 },
    { "Haddock" => 4.85 },
    { "Fishcake" => 1.15 },
    { "Battered sausage" => 1.15 },
    { "Spring roll" => 2.50 },
    { "Bread roll" => 0.55 },
    { "Curry sauce" => 1.30 },
    { "Mushy peas" => 1.30 }].freeze

  # @MenuHeader = "Welcome to the Jolly Chip Shop.\n".center(50)
  # @MenuHeader += "===============================\n".center(50)
  # @MenuHeader += "Take a look at our menu\n".center(50)

  def format_dish_by_index(index)
    DISHES[index].map { |key, value| "#{key} - £#{'%.2f' % value}" }
  end

  def format_menu_items
    DISHES.each_with_index.map { |_, i| format_dish_by_index(i) }.join("\n")
  end

  # def print_menu
  #   format_menu_items
  # end

end
