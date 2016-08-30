require_relative 'menu_builder'
require_relative 'sum_items'
require_relative 'text_logs'
require 'tty-prompt'
require 'yaml'


class MenuSelector

  def initialize(menu = MenuBuilder.new, order = SumItems.new)
    @menu = menu
    @order = order
  end

  def menu
    @menu.list.to_yaml
  end

  def select
    @prompt = TTY::Prompt.new
    @selection = @prompt.multi_select("Select food items below:", select_sort)
    another_selection
    @order.sum_items(@selection)
  end

  def receipt
    @order.send_receipt
  end

  def text
    @order.send_order_to_text
  end

  private

  def select_sort
    array = []
    0.upto(@menu.list.size-1) do |i|
      array << "#{@menu.list.keys[i]}: #{@menu.list.values[i]}"
    end
    array
  end

  def another_selection
    while @prompt.yes?('Would you like to order more items?')
      @selection.concat(@prompt.multi_select("Select food?", select_sort))
    end
    @selection
  end

end


