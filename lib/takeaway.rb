require_relative 'menu'

class Takeaway
  def initialize(menu=Menu.new)
    @menu = menu
  end

  def fetch_menu
    @menu.parse_file
  end

  def display_menu
    fetch_menu.each_with_index { |item, index| puts "#{index + 1}. #{item[:name]} - £#{item[:cost]}" }
  end
end
