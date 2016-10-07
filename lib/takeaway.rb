class TakeAway
  
  attr_reader :show_menu        #, :menu  
  
  
  #def initialize
    
  #end
  
  def show_menu
    menu = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
    menu.each{|k,v| puts "#{k} £#{v}"}
  end
  
  def order
    
  end
  
  
end


thai = TakeAway.new
thai.show_menu