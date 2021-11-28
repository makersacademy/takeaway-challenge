class Menu
 attr_reader :menu_items
  def initialize(menu_items)
    @menu_items = menu_items
  end 

  def print
   @menu_items.each do |item, price|
    puts "#{item}: £#{price}"
   end 
  end 
end 