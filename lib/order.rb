require_relative 'menu'

class Order

  attr_reader :menu

  def initialize(menu = Menu.new.current_menu)
    @menu = menu
  end

  def list_menu
    @menu.each_with_index { |menu, index| puts "#{index + 1}: #{menu[:food]} £#{menu[:price]}" }
  end

end
