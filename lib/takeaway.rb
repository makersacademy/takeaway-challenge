require_relative 'messager'
require_relative 'menu'

class TakeAway
  
  attr_reader :read_menu, :menu, :item, :order, :orders, :messager      
  
  def initialize(menu = Menu.new, messager = Messager.new)
    @menu_obj = menu
    @messager = messager
    @orders = []
    @menu =  @menu_obj.menu
  end
  
  def change_menu(file)
    @menu_obj = Menu.new(file)
  end

  def read_menu
    @menu_obj.read_menu
  end
  
  def order(item, qty=1)
    print :"That item is not on the menu.\n" unless @menu_obj.contains?(item) 
    (qty.times {add_item(item)}) if @menu_obj.contains?(item)
    print "#{qty} x #{item}(s) added to your order.\n" if @menu_obj.contains?(item)
    print "Use '.summary' to show your order. Use '.total' to show the total cost. Use '.checkout(val)' to submit your order.\n"
  end
  
  def summary
      counts = Hash.new 0
      orders.each {|p| counts[p] += 1}
      output_arr = []
      counts.each{|key,val| 
      	key.each{|k,v|
      	output_arr << "\"#{k}\" x #{val} = £#{(key[k] * val).round(2)}"
      	}
      }	
      print output_arr.join(", ")
  end
  
  def total
    @tot = 0
    orders.each{ |item| item.each_value{|v| @tot += v} }
    @tot = @tot.round(2)
    print "Total: £#{@tot}"
  end
  
  def checkout(value)
    print "Your order total does not match the calculated total" if @tot != value
    complete_order(value) if  @tot == value
  end
  
  def complete_order(total_price)
    send_text("Thank you for your order. Total price: £#{total_price}")
  end


  
  private
  def send_text(message)
    @messager.send_message(message)
  end
  
  def add_item(item)
    orders << @menu_obj.get_details(item)       
  end
  
end

# #=begin
# # require './lib/takeaway'
# menu = Menu.new("menu1.csv")
# thai = TakeAway.new(menu)
# thai.change_menu("menu.csv")
# thai.read_menu                
# thai.order "spring roll", 3
# thai.order "peking duck", 4
# puts thai.order "xxx"
# puts thai
# print thai.inspect
# puts thai.summary
# puts thai.total
# puts thai.checkout(34.92)


#=end
