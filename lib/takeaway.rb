require 'menu'

class Takeaway
  attr_reader :menu

  def initialize(menu_items = {})
    @menu = Menu.new(menu_items)
  end
end
