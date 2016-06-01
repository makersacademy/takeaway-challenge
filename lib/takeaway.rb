require_relative './menu.rb'
require_relative './order.rb'
require 'tty-prompt'
require 'yaml'


class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    neat_list
  end

  def print_menu
    puts "#{neat_list}"
    neat_list
  end

  def select
    choices = select_sort
    @selection = TTY::Prompt.new.multi_select("Select food?", choices)
    @order.items(@selection)
  end

  private

  def neat_list
    neat_list = @menu.list.to_yaml
  end

  def select_sort
    array = []
    0.upto(@menu.list.size-1) do |i|
      array << "#{@menu.list.keys[i]}: #{@menu.list.values[i]}"
    end
    array
  end

end


