# Responsible for sending order confirmation to customer

class Confirmation

  def intitialize
    expected_delivery_time = nil
  end

  def expected_delivery_time 
    time = Time.now + 3600
    time.strftime("%k:%M")    
  end
end
