require_relative 'cart'

class TakeAway

  def show_menu
    @menu = Cart.new.menu
  end

end
