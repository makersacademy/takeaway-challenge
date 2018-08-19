require_relative 'menu'
require_relative 'messenger'

class Order

  attr_reader :menu, :selected

  def initialize(menu = Menu.new.current_menu, messenger = Messenger.new)
    @menu = menu
    @messenger = messenger
    @selected = []
  end

  def list_menu
    @menu.each_with_index { |menu, index| puts "#{index + 1}: #{menu[:food]} £#{menu[:price]}" }
  end

  def add_items(item_number, ammount = 1)
    ammount.times { @selected << @menu[item_number - 1] }
  end

  def list_order
    @selected.group_by { |item| item }.map { |k, v| [k, v.count] }
  end

  def total_cost
    @total = 0
    @selected.each { |item| @total += item[:price] }
    @total
  end

  def complete_order
    @messenger.complete_order(@total)
  end

end
