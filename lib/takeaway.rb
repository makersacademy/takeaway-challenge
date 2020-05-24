require_relative "menu"
class Takeaway

  def see_menu
    Menu.new.read
  end

end
