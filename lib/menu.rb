require "csv"

class Menu

  attr_reader :menu_items, :dish, :price

  def initialize(filename = "menu.csv")
    @menu_items = {}
    load_menu(filename)
  end

  def print
    i = 1
    @menu_items.each_pair do |dish, price|
      left_aligned = "#{i}. #{dish}"
      right_aligned = "£" + sprintf('%.2f', price)
      puts left_aligned.ljust(20) + right_aligned.rjust(12)
      i += 1
    end
  end

  private

  def load_menu(filename)
    CSV.foreach(filename) do |line|
      @dish, @price = line[0], line[1].to_f.round(2)
      populate_menu_items
    end
  end

  def populate_menu_items
    @menu_items[@dish] = @price
  end

end
