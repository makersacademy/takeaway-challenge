class Takeaway
  attr_reader :menu, :price, :number, :total_sum

  def initialize
    @menu = ["Pasta: £3.50", "lasagna: £4.50", "water: £1.50"]
    # @price = price
    # @number = number
    # @total_sum = total_sum
  end

  def order
    @menu
    # if @menu == @menu[0]
    #   puts "you ordered = Pasta: £3.50"
    # elsif @menu == @menu[1]
    #   puts "you ordered = lasagna: £4.50"
    # elsif @menu == @menu[2]
    #   puts "you ordered = water: £1.50"
    # else
    #   puts "Please make an order!"
    # end
  end

end
