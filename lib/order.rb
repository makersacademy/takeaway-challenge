require './lib/menu'

class Order 

  attr_reader :item_list 
  attr_reader :total
  attr_reader :menu

  def initialize(menu)
    @item_list = {}
    @menu = menu
  end

  def add(item, quantity)
    @item_list[item] = quantity
  end

  def calculate_total
    @total = 0
    @item_list.each do |key, v|
      @total += (@menu.list[key] * v)
    end
    @total
  end 
end 
