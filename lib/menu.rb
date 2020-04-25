class Menu
  attr_reader :name, :items

  def initialize(*menu_items)
    @items = menu_items
  end

  def show_menu
    @items.each do |item|
      puts "#{item.name} - £#{item.price}"
    end
  end
end
