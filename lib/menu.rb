require_relative 'menu_item'

class Menu

  # not all lines covered here - only 86%

  def initialize menu_item_class = MenuItem
    @current = []
    @menu_item_factory = menu_item_class
  end

  def list
    current.inject(''){|sum,item| sum << "#{item.name}: #{item.price}\n"}
  end

  def add item_name, item_price
    fail "already on menu" if on_menu? item_name
    @current << @menu_item_factory.new(item_name, item_price)
    nil
  end

  def remove item_name
    fail "not on menu" unless on_menu? item_name
    current.each{|item| current.delete(item) if item.name == item_name}
    nil
  end

  def get item_name
    current.each{|item| return item if item.name == item_name}
    fail "not on menu"
  end


  private
  attr_reader :current

  def on_menu? item_name
    !!current.find{|item| item.name == item_name}
  end

end


thai = Menu.new

thai.list

thai.add "kung-po", 7
thai.add("chop-suey", 5)

p thai.remove "chop-suey"

puts thai.list
# p thai.add "egg phoo yung", 6
#
# puts thai.list
# p ""
#
# thai.remove "kung-po"
# puts thai.list
