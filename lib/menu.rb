class Menu
attr_reader :order, :total, :menu_hash
  def initialize(menu_hash)
    @menu_hash = menu_hash
    @order = []
    
  end



  def prints_order
    @order.each do |hash|
      puts "food: #{hash[:food]}, amount: #{hash[:amount]}, price: £#{hash[:price]}"
    end 
    puts "£#{@total}"
  end 
    

end 
    

