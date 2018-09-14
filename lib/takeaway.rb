class Takeaway

  def initialize
    @menu = {
      :fish_and_chips => '£3.20', 
      :burger_and_chips => '£4.20', 
      :chips => '£1'
    }
  end
  
  def menu
    @menu
  end

end 
