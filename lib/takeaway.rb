require_relative "menu"

class Takeaway

  attr_reader :menu

  def initialize (menu = Menu.new)
    @menu = menu
  end

  def print_menu
    (menu.dishes).map {|key,value|"#{key}. #{value[0]} £#{value[1]}"}.join(',')
  end

end
