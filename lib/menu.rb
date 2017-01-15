class Menu

  def print_menu
    MENU.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end

private

MENU = { "chicken" => 5.50, "lamb" => 2.40, "beef" => 3.60, "fish" => 4.50 }.freeze

end
