require 'CSV'
class List

  def view_items(file="takeawaylist.csv")
    load_csv(file)
    print_menu_items
  end

  private

  attr_accessor :menu_items

  def load_csv(file)
    CSV.foreach(file) { |row| build_menu_item(row) }
  end

  def build_menu_item(row)
  end

  def print_menu_items
  end

end
