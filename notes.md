per iniziare in tutti i metodi metti un return esplicito.  
  
  
  def create_order 

    Menu.show
    Order.new
    
    while true do 
    puts "Select your dishes"
      selection = gets.chomp 
        if selection == ""
          break
        else
          @items < selection
    end
   end
