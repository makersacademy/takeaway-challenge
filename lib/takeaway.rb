require_relative "menu"

class Takeaway

  attr_reader :menu

  def initialize (menu = Menu.new)
    @menu = menu
  end

  def print_menu
    (menu.dishes).map do |items|
      items.map {|key,value| "#{key}: £#{value}"}
    end.join(",")
  end

end
