class Menu

  def initialize 
    @menu_items = {
      Lasagne: 12,
      Risotto: 8,
      Carbonara: 10
    }
  end 

  def read_menu
    @menu_items.each do |item, price|
      puts "#{item}  --£#{price}"
    end 
  end 

  def dish?(item)
    !@menu_items[item.to_sym].nil?
  end 

  def price(item)
    @menu_items[item.to_sym]
  end 
end 
 