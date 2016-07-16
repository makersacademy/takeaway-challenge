class Menu

attr_accessor :item_list

def initialize
  @item_list = {balti: 5.00, vindaloo: 4.50}
end

def print_menu
  item_list.map {|key,value| "#{key} £#{value}"}.join(" , ")
end
end


private
