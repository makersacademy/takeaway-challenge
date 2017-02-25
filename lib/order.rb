require_relative 'menu'

class Order

attr_reader :items

def initialize
  @items = []
end

def assign_dishes(dishes)
  dishes
end

def check_total(dishes = [""], check_total)
  total = 0
  dishes.each do |dish|
    all_menu_items.each { |item| total += item.price  if item.name == dish}
  end
  puts "Bill total has been checked" if total == check_total
  total
end

def all_menu_items
  menu = Menu.new
  menu.list
end

end
