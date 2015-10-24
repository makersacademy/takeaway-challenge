require './lib/menu.rb'

class Order

attr_reader :item, :current_order, :current_menu, :item_no

def initialize(menu_klass: Menu)
  @current_order = []
  @current_menu = []
  @menu_klass = menu_klass
end

def start_order(item, item_no)
 current_menu << menu_klass.new
 current_order << current_menu[0].menu.select {|k,v| k == item}
 current_order[-1][:item_no] = item_no
end

def next_item(item, item_no)
  current_order << current_menu[0].menu.select {|k,v| k == item}
  current_order[-1][:item_no] = item_no
end

private

attr_reader :menu_klass

end
