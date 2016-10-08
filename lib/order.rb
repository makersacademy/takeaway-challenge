require_relative 'menu'

class Order

  attr_reader :menu, :selection

  def initialize
    @menu = Menu.new
    @selection = []
  end

  def show_menu
    @menu.see_menu
  end

  def select_item(item_number)
    @selection << @menu.menu[item_number - 1]
  end

  def show_order
    item_number = 0
    @selection.each {|item| item_number += 1; puts "#{item_number}. #{item[:name]} : £#{item[:price]}" }
  end
end
