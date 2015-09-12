require_relative 'menu'
require_relative 'order'

class Customer
  include Menu

  def check_menu
    menu
  end



end
