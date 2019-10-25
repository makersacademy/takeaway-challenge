# Module to print menu
module PrintMenu
  def self.print_menu(array)
    print stringify_menu(array)
  end

  def self.stringify_menu(array)
    array.map.with_index { |item, idx| "#{idx + 1}. #{item.name} #{item.price}" }.join("\n")
  end
end
