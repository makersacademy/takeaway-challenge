class Menu
  def display
    { "Kebab" => 10, "Chips" => 2 }
  end

  def price(prices)
    display[prices]
  end
end
