require_relative 'menu'
require_relative 'dish'

class Order

attr_reader :items

def initialize
  @items = []
end

def assign_dishes(dishes)
  dishes.each do |dish|
    all_menu_items.each { |item| @items << item if item.name == dish}
  end
  @items
end

def check_total(dishes=[], check_total)
  total = 0
  dishes.each do |dish|
    all_menu_items.each { |item| total += item.price  if item.name == dish}
  end
  fail "Bill total and total don't match" if total != check_total
  raise "Bill total and total match" if total == check_total

end

def all_menu_items
  menu = Menu.new
  menu.list
end

end
