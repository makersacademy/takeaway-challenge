require_relative 'menu'

class Order

  attr_reader :menu, :selected, :ordered_list

  def initialize(menu = Menu.new.current_menu)
    @menu = menu
    @selected = []
    @ordered_list = ordered_list
    @total = 0
  end

  def list_menu
    @menu.each_with_index { |menu, index| puts "#{index + 1}: #{menu[:food]} £#{menu[:price]}" }
  end

  def add_items(item_number, ammount = 1)
    ammount.times { @selected << @menu[item_number - 1] }
  end

  def list_order
    @ordered_list = @selected.group_by { |i| i }.map { |k, v| [k, v.count] }
  end

  def total_cost
    @total = 0
    @selected.each { |item| @total += item[:price] }
    @total
  end

end
