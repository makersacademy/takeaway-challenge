require_relative 'menu'
require_relative 'order'
require_relative 'messager'

class Restaurant

attr_reader :menu, :messager

  def initialize(menu = Menu.new)
    @menu = menu
    @messager = Messager.new
  end

  def confirm_order(total)
    @messager.send("Thanks for your order. That's £#{total}")
  end


end
