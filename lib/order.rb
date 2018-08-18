require_relative 'menu'

class Order

  attr_reader :menu, :selected

  def initialize(menu = Menu.new.current_menu)
    @menu = menu
    @selected = []
  end

  def list_menu
    @menu.each_with_index { |menu, index| puts "#{index + 1}: #{menu[:food]} £#{menu[:price]}" }
  end

  def add_items(item_number, ammount = 1)
    ammount.times { @selected << @menu[item_number - 1] }
  end
  
end
