class Menu
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print_menu
    @items.map do |name, price|
      "#{name} ~ £#{sprintf('%.2f', price)}"
    end.join(" | ")
  end
end

# x = Menu.new({Soup: 2, Bread: 1})
# puts x.print_menu