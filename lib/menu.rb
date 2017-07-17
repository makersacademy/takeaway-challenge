class Menu

  attr_reader :items

  def initialize
    @items = { "Margherita" => 5.99, "Quattro Formaggio" => 6.99, "Vegetariano" => 6.99,
      "Pepperoni" => 7.99, "Pollo" => 7.99 }
  end

  def print
    puts "Pizza Capanna"
    puts "--------------------------"
    items.each { |item, price| printf "%-20s %s\n", item, "£#{price}" }
  end
end
