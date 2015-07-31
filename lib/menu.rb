class Menu

  attr_reader :items

  def initialize
    @items = {burger: 10, pizza: 8, soup: 7}
  end

  def view_menu
    items.each { |k,v| puts "#{k}: #{v} GBP" }
  end

end
