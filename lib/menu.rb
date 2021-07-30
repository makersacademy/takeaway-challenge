class Takeaway
  attr_reader :menu
  
  @menu = {
      "curry" => 12, 
      "burger" => 14, 
      "pizza" => 10
    }

  def show_menu
    return @menu
  end
end
