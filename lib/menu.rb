require 'csv'


class Menu
  
  attr_reader :dishes, :menu
  
  def initialize
    #@dishes = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}     
    @menu = Hash.new 
  end
  
  def load_menu (filename = "menu.csv")    
      
    CSV.foreach(filename, col_sep: ',') do |row|     
      item, price = row
      load_items(item,price)
    end
    print "Use \".load_menu(menu_name.csv)\" to load a non default menu\n"
  end
  
  def to_s
    'the menu is empty'   # menu = Menu.new,  puts menu, to_s is called by default when `puts`ing an object in Ruby
  end
  
  private
  def load_items(item,price)
    @menu[item] = price
  end

end


menu = Menu.new
menu.load_menu("menu1.csv")
puts menu.menu.inspect
