require './lib/menu.rb'

class Order

attr_reader :list_of_dishes, :selected_items

def initialize(m = Menu.new)
  @list_of_dishes = m
  @selected_items = []
end

def view_dishes
  @item = @list_of_dishes.list
end

def select_dishes(item, quantity)
  @total = 0
  i = 0
  selection = @list_of_dishes.list.select do |hash|
  hash[:name] == item
  end
  quantity.times {@selected_items.push(selection[i])}
  i += 1
  @selected_items.each do |hash|
  @total += (hash[:cost].to_i)
  end
end

def total
  @total
end

end