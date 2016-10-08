class TakeAway
  
  attr_reader :show_menu, :menu, :item, :order, :orders       #, :menu  
  
  def initialize
    @orders = []
    @menu = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
  end
  
  def show_menu                         #(menu = {"spring roll"=>0.99})       
    menu.each{|k,v| puts "#{k} £#{v}"}
  end
  
  def order(item)
    print :"That item is not on the menu." unless on_menu?(item) 
    add_item(item) if on_menu?(item)      
  end
  
  private
  
  def add_item(item)
    orders <<  menu.select { |k, v| k[item] }
  end
  
  def on_menu?(item)
    menu[item]
  end
  
  
end

thai = TakeAway.new
thai.show_menu
thai.order "spring roll"
thai.order "peking duck"
thai.order "spring roll"
thai.order "xxx"
print thai.inspect

