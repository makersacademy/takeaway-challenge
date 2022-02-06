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
    availability = 0
    @menu.each do |dish, price|
      if dish == item
        availability += 1
      end
    end

    if availability == 1
      (quantity).times{@basket << item}
      return "Great! #{quantity} portions of #{item} have been added to your order"
    else
      return 'Sorry, this is unavailable' 
    end

  end


end













 # puts "Our Take-Away Menu:"
    # @menu.each do |k,v| 
    #    print k
    #    puts " - £#{v}"
    # end