class Text 

  def sms(phone)
    one_hour_from_now = (Time.now + 60 * 60).strftime("%H:%M")
    order_confirmation = "Thank you! Your order was successfully " +
     "placed and will be delivered before #{one_hour_from_now}" +
     " Send to: #{phone}"
    puts order_confirmation
  end

end
