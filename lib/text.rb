class Text 
  attr_reader :message 

    
  def initialize
    @message = "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}"
  end

  def confirm_order
    "#{@message}"
  end 

end
