require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.format_menu
  end

  def preview_order(*items)
    items.each do |item|
      puts item
    end
  end

end
