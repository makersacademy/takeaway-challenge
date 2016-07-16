require_relative 'menu'

class Restaurant

  attr_reader :menu

  def view_menu
    create_menu
    @menu
  end

private

  def create_menu
    @menu = Menu.new
  end

end
