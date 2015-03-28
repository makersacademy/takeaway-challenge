class Restaurant
  def initialize(*menu_items)
    @menu_items = menu_items
  end

  def show_menu
    menu = ""
    menu_items.each_with_index do |item, index|
      menu += "#{index + 1}. #{item.name} - £#{item.price}\n"
    end
    menu.chomp
  end

  private

  attr_reader :menu_items
end