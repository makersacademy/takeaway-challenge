class Text 

  def send_text 
    puts "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

 # private

  def delivery_time
    time = Time.now + 60*60
    time.strftime("%H:%M") 
  end
end
