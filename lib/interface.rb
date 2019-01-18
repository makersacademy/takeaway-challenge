require_relative 'menu'

# Lets user read a menu and place an order
class Interface
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_list
    output = []
    menu.items.each { |k, v| output << k + ", " + v.to_s }
    output.join("\n")
  end

  private

  attr_reader :menu
end
