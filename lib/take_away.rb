class Takeaway
   attr_accessor :menu
   attr_reader :basket
  def initialize
    @menu = {
      "burger" => 5.00,
      "chips" => 2.00,
      "coke" => 1.00
    }
    @basket = []
    @total = 0
  end
  def list_menu 
    @menu
  end
  def add_item(item)
    @basket.push(item)
    cost = @menu.fetch(item)
    @total += cost
  end

end