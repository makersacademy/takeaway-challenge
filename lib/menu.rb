class Menu
  attr_reader :menu_items, :basket
  
  def initialize 
    @menu_items = [
      {item: "Kung po chicken", price: 6.80},
      {item: "Chicken chow mein", price: 6.50},
      {item: "Egg fried rice", price: 4.50}
    ]
    @basket = []
  end

  def view_menu
    @menu_items.each do |menu_item| puts "#{menu_item[:item]} £#{'%.2f' % menu_item[:price]}"
    end
  end

  def select(item_num)
    @basket << menu_items[item_num]
  end
end