require 'csv'

class Menu
  
  attr_reader :dishes, :menu          #, :filename
  
  def initialize(filename = "menu.csv")    #= "menu.csv"
    #@dishes = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}     
    #@filename = filename
    @menu = Hash.new
    load_menu (filename) 
  end
  
  def load_menu (filename)             #filename = "menu.csv")    
      
    CSV.foreach(filename, col_sep: ',') do |row|     
      item, price = row
      load_items(item,price)
    end
    print "Use \".load_menu(menu_name.csv)\" to load a non default menu\n"
  end
  
  
  def read_menu                         #(menu = {"spring roll"=>0.99})       
    menu.each{|k,v| puts "#{k} £#{v}"}
    print "Use '.order(food_description)' to add items.\n"
  end
  
  def contains?(item)
    !!menu[item]
  end
  
  def get_details(item)             #Works but returns a string value of amount and I don't have time to sort this out!!!!!
    menu.select { |k, v| k[item] }  #so will stick with method in takeaway.    
  end
  
  
  def to_s
    'the menu is empty'   # menu = Menu.new,  puts menu, to_s is called by default when `puts`ing an object in Ruby
  end
  
  private
  
  def load_items(item,price)
    @menu[item] = price.to_f
  end

end


menu = Menu.new
#menu = Menu.new("menu1.csv")
#menu.load_menu("menu.csv")
menu.load_menu("menu1.csv")
                      #puts menu.get_details("peking duck")
puts"~~~~~~~~~~~~~~~~~~~~~"
#puts menu.menu.inspect
puts menu.menu
menu.read_menu
puts menu.contains?("pork dumpling")