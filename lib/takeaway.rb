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
    if menu[item]
      orders <<  menu.select { |k, v| k[item] }       
    else
      print :"That item is not on the menu."
    end
    
  end
  
  
end


thai = TakeAway.new
thai.show_menu
thai.order "spring roll"
#thai.order "xxx"
print thai.inspect