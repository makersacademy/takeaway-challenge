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
      puts "#{i}. #{dish} £" + sprintf('%.2f', price)
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
