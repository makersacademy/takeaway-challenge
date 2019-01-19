require_relative 'menu'
class Takeaway

attr_reader :menu

def initialize(menu=Menu.new.dish)
  @menu = menu.to_h
end

  def display_menu
  end

  def order

  end


end
