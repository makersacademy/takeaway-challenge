
class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    @item = []
    @total = []
  end

  def list_items
    @menu.list_items
  end


  def order_items
    p "What would you like to order?"
    p "To finish ordering please type end"
    input = gets.chomp
    while input != "end"
      @item << input
      input = gets.chomp
    end
  end

  def order_total

    @item.each do |item|

      @total << 5  if item == "burger"

      @total << 10 if item == "pizza"

      @total << 2 if item == "fries"

      @total << 3 if item == "salad"
    end

    sum = 0
    @total.each do |i| (sum += i)
    end
    p "Your order total is £#{sum}"
  end
end
