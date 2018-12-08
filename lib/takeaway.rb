require_relative 'menu'
require_relative 'user_input'

class Takeaway

  def initialize(menu = Menu.new, user_input = UserInput.new)
    @menu = menu
    @user_input = user_input
  end

  def display_menu
    @menu.display
  end

  def select_from_menu
    selection = {}
    display_menu.each do |item|
      number = 0
      if @user_input.ask(item)
        number = @user_input.quantity
      end
      selection[item] = number if number != 0
    end
    selection
  end

end
