require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = { pizza: 7.50, burger: 6.50, pasta: 5.00 }
  end


  def view_menu
    menu.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")

  end
end
