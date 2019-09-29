require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def view_menu
    @menu.view_items
  end

  # def make_order
  # end
  #
  # private
  #
  # def send_confirmation
  # end
end
