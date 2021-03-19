require 'order'

class Message 
  def initialize
    @time = (Time.now + 1*60*60).strftime("%I:%M%p")  
  end

  def complete
    return "Thank you! Your order has been placed and will be with you by #{@time}"
  end 
end