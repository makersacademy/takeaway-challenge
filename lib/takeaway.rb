require_relative 'menu'
require_relative 'text_message'

class Takeaway  
  attr_reader :menu, :text

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @text = text
  end

  def show_menu
    @menu.print
  end

  def order(dish, quantity)

  end


end