require_relative 'menu.rb'

class Order

  attr_reader :in_progress

  def initialize
    @in_progress = Hash.new(0)
  end

  def add_item(item)
    raise "Error: #{item} not found on menu" if item_not_on_menu?(item.to_sym)
    @in_progress[item.to_sym] += 1
    @in_progress
  end

  def item_not_on_menu?(item)
    !Menu::MENU.key?(item)
  end


  def make
    @in_progress
  end

end
