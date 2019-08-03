class PrintedMenu

  PRINTED_MENU = { "Water" => 3, "Tea" => 4, "Coffee" => 2 }

  def print_printed_menu
    PRINTED_MENU
  end

  def print_nicely
    PRINTED_MENU.map do |item, price|
      "#{item}: £#{price}"
    end.join(", ")
  end
end
