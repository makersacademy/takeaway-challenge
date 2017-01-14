require_relative 'menu'

class Takeaway

  # def initialize
  #   @menu = menu
  # end

  def show_menu
    @menu = Menu.new.dishes
  end


end
