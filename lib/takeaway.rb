require_relative 'menu'

class Takeaway

  def initialize(menu)
    @menu = menu
  end

  def view_menu
    @menu.items.each_with_index do |item, index|
      puts "#{index+1}: #{item[:name]} £#{item[:cost]}"
    end
  end

end

shop = Takeaway.new(Menu.new)
shop.view_menu
