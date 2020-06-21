require_relative 'menu'

class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def see_menu
    display = String.new
    @menu.list.each do |dish, price|
       display << "#{dish}: £#{price}\n"
    end
    display
  end

end