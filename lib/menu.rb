require_relative './menu_list.rb'
require_relative './text_message.rb'

class Menu

  def initialize
    @list = MenuList.new
    @text = TextMessage.new
  end

  def load_menu
    @list.load_menu
  end

  def show_menu
    puts @list.display_menu
    @list.display_menu
  end

  def order(*args)
    matched_dishes = []
    args.each do |num|
      return_dish = @list.return_dish(num)
      matched_dishes << return_dish if return_dish
    end
    matched_dishes
  end
end
