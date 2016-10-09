require_relative 'messager'
require_relative 'menu'

class TakeAway
  
  attr_reader :read_menu, :menu, :item, :order, :orders, :messager      
  
  def initialize(menu = Menu.new, messager = Messager.new)
    @menu1 = menu
    @messager = messager
    @orders = []
    @menu = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
  end
  
  def read_menu                         #(menu = {"spring roll"=>0.99})       
    menu.each{|k,v| puts "#{k} £#{v}"}
    print "Use '.order(food_description)' to add items.\n"
  end
  
  def order(item, qty=1)
    print :"That item is not on the menu.\n" unless on_menu?(item) 
    (qty.times {add_item(item)}) if on_menu?(item)
    print "#{qty} x #{item}(s) added to your order.\n" if on_menu?(item)
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

  def send_text(message)
    @messager.send_message(message)
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
# require './lib/takeaway'
thai = TakeAway.new
puts thai.read_menu                
thai.order "spring roll", 3
thai.order "peking duck", 4
          #thai.order "spring roll"
          #thai.order "fu-king fried rice",3
puts thai.order "xxx"
puts thai
print thai.inspect
puts thai.summary
puts thai.total
puts thai.checkout(34.92)


#=end
