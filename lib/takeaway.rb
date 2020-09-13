class Takeaway

attr_reader :menu

  def initialize 
    @menu = {chicken: 4.99, chips: 1.50}
  end 

  def view 
    @menu
  end

end