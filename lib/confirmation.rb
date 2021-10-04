require_relative "takeaway.rb"

class Confirmation 
  #Confirmation --> dishes_selected --> selected_dish_total --> confirmed 
  #Confirmation --> confirmed --> text_sent 
  #--> "Thank you! Your order was placed and will be delivered before 18:52"
  #Method without Twilio API 
  #Dummy code unfinished 
  
  def selected_dish_total
    if dishes_selected == selected_dish_total.last 
      puts "Thank you! Your order was placed and will be delivered before 18:52"
    else 
      puts "Check order"
    end 
  end 

end 