class Menu
  attr_reader :items

  def initialize(items_as_hash)
    @items = items_as_hash
  end

  def list_menu
    menu = ""
    items.each{|item, price| menu << "#{item}: £#{price}, "}
    menu.strip.chomp(",")
  end

end
