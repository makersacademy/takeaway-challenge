class Takeaway
  attr_reader :menu, :order

  def initialize
    @order = []
  end
  
  def show_menu
    @menu = {
      "curry" => 12, 
      "burger" => 14, 
      "pizza" => 10
    }
  end

  def select_meal(choice)
    @order.push(choice)
  end
end
