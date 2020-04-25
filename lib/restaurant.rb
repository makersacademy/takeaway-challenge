class Restaurant
  attr_reader :name, :menu

  def initialize(*menu_items)
    @menu = menu_items
  end

  def show_menu
    @menu.each do |item|
      puts "#{item.name} - £#{item.price}"
    end
  end
end
