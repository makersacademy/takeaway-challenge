require_relative "menu_item"

class Menu
  def initialize
    @items = [
      MenuItem.new("Margherita", 10),
      MenuItem.new("Diavola", 11),
      MenuItem.new("Boscaiola", 14),
      MenuItem.new("Quattro Stagioni", 13),
      MenuItem.new("Capricciosa", 12),
      MenuItem.new("Marinara", 9),
    ]
  end

  def select(index)
    @items[index.to_i - 1]
  end

  def to_s
    str = "Pizza Takeaway\n"
    str += "===============================\n"

    @items.each.with_index(1) do |item, i|
      str += "#{i}. #{item}\n"
    end

    str + "===============================\n"
  end
end
