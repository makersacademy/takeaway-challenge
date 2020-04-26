class Text 

  def inisialize
    @time = Time.new
  end

  def sms(phone)
   puts "Thanks! Order been send to #{phone}\n 
    And will delivered #{@time}"
  end

end