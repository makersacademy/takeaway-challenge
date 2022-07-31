class Menu
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print_menu
    @items.map do |name, price|
      "#{name.capitalize} ~ £#{sprintf('%.2f', price)}"
    end.join(" | ")
  end
end
