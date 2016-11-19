require_relative "menu"

class Takeaway
  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu.list
  end

  def see_menu
    @menu.each do |item, price|
      puts "#{item}, £#{price}"
    end
  end

end
