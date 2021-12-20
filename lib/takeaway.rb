require_relative 'menu'

class Takeaway
  def initialize(menu=Menu.new)
    @menu = menu
  end

  def fetch_menu
    @menu.parse_file
  end

  def display_menu
    fetch_menu.each { |item| puts "* #{item[:name]} - £#{item[:cost]}" }
  end
end
