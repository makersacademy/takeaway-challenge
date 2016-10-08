class TakeAway
  
  attr_reader :read_menu, :menu, :item, :order, :orders       #, :menu  
  
  def initialize
    @orders = []
    @menu = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
  end
  
  def read_menu                         #(menu = {"spring roll"=>0.99})       
    menu.each{|k,v| puts "#{k} £#{v}"}
  end
  
  def order(item, qty=1)
    print :"That item is not on the menu." unless on_menu?(item) 
    (qty.times {add_item(item)}) if on_menu?(item)      
  end
  
  private
  
  def add_item(item)
    orders <<  menu.select { |k, v| k[item] }
  end
  
  def on_menu?(item)
    menu[item]
  end
  
  
end

#=begin
#require './lib/takeaway'
thai = TakeAway.new
thai.read_menu
thai.order "spring roll"
thai.order "peking duck", 2
thai.order "spring roll"
thai.order "fu-king fried rice",3
thai.order "xxx"
print thai.inspect
#=end
