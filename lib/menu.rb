class Menu


  def initialize

    @available_dishes = {
      "fish & chips" => "£5.20", 
      "sandwhich" => "£3.20", 
      "shepherd's pie" => "£4.50", 
      "pot roast and gravy" => "£6.50", 
      "macaroni and cheese" => "£4.75"
    }
  end 


  def see_menu
    @available_dishes.each do |dish, price|
      p "#{dish}: #{price}"
    end
  end
end