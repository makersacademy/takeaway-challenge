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

  private

  def item_available?
    available = false
    @menu.each do |dish, price|
      available = true if dish == @item
    end
    available == true
  end

end













 # puts "Our Take-Away Menu:"
    # @menu.each do |k,v| 
    #    print k
    #    puts " - £#{v}"
    # end