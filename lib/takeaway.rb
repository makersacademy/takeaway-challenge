class Takeaway

  attr_reader :menu


  def initialize
    @menu = {"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 }
  end

  def display_menu
    @menu.to_s
  end


end
