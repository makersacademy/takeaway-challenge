module MenuPrinter

  def self.to_string(menu_array)
    menu_array.each_with_index.map { |dish, index|
      "#{index + 1}. #{dish[:dish]}, £#{dish[:price]}"
    }.join("\n")
  end

end
