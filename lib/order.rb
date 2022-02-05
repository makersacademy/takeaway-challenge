require_relative 'takeaway'

class Order
  def view_menu(takeaway)
    p takeaway.display_menu
  end

end
