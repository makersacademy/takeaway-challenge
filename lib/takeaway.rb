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

  def order_from_menu
    order = {}
    display_menu.each do |item, _|
      number = 0
      if @user_input.ask(item)
        number = @user_input.quantity
      end
      order[item] = number if number != 0
    end
    order
  end

end
