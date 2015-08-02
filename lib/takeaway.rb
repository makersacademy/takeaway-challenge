class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = { "pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45, "bacon sandwich" => 3.50, "steak and chips" => 10.95 }
  end

  def place_order(item1,*items)
    @order = [item1]
    items.each do |x|
      item_checker(item1,x)
      order << x 
    end
  end

  private

  def item_checker(item1,item2)
    fail "Apologies, we do not have #{item1} on the menu." if !menu.include?(item1)
    fail "Apologies, we do not have #{item2} on the menu." if !menu.include?(item2)
  end

end