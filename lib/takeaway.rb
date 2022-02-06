class Takeaway
  
  attr_reader :menu, :basket
  DEFAULT = 1

  def initialize
    @menu = {'Fish' => 1, 
             'Burger' => 2, 
             'Chips' => 3, 
             'Pizza' => 8, 
             'Pasta' => 0.5
            }
    @basket = []
  end

  def display_menu
    @menu
  end

  def order(item, quantity = DEFAULT)
    @item = item
    return 'Sorry, this is unavailable' unless item_available?
      (quantity).times{@basket << item}
      "Great! #{quantity} portions of #{item} have been added to your order"
  end


  def review_order
    order_collation
    display_message = ""
    # basket_total = 0
    @order_summary.each do |dish, quantity|
      dish_total = quantity * (@menu[dish])
      display_message << "In your basket you have #{quantity} #{dish} totalling £#{dish_total}. "
    #   basket_total += dish_total
    end
    display_message << "Your order comes to £#{basket_total}."
  end

  private

  def basket_total
    total = 0
    @order_summary.each do |dish, quantity|
      total += quantity * (@menu[dish])
    end
    total
  end

  def item_available?
    available = false
    @menu.each do |dish, price|
      available = true if dish == @item
    end
    available == true
  end

  def order_collation
    @order_summary = {}
    @menu.each do |dish, price|
      quantity = 0
        @basket.each do |item|
            quantity += 1 if dish == item
            @order_summary[dish] = (quantity) if quantity != 0
        end
    end
  end

end













 # puts "Our Take-Away Menu:"
    # @menu.each do |k,v| 
    #    print k
    #    puts " - £#{v}"
    # end