require 'csv'


class Menu
  
  attr_reader :menu     
  
  def initialize(filename = "menu.csv")   
    @menu = Hash.new
    load_menu (filename) 
  end
  
  def load_menu(filename)       
    CSV.foreach(filename, col_sep: ',') do |row|     
      item, price = row
      load_items(item,price)
    end
    print "Use \".load_menu(menu_name.csv)\" to load a non default menu\n"
  end
  
  def read_menu                           
    menu.each{|k,v| puts "#{k} £#{v}"}
    print "Use '.order(food_description)' to add items.\n"
  end
  
  def contains?(item)
    !!menu[item]
  end
  
  def get_details(item)           
    menu.select { |k, v| k[item] }    
  end
  
  private
  
  def load_items(item,price)
    @menu[item] = price.to_f
  end

end


# menu = Menu.new
# menu = Menu.new("menu1.csv")
# #menu.load_menu("menu.csv")
# menu.load_menu("menu1.csv")
#                       #puts menu.get_details("peking duck")
# puts"~~~~~~~~~~~~~~~~~~~~~"
# #puts menu.menu.inspect
# puts menu.menu
# menu.read_menu
# puts menu.contains?("pork dumpling")


