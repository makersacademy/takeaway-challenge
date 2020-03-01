class Basket
  def initialize
    @contents = []
  end

  def print
    puts "Basket"
    puts ""
    @contents.map{|item| puts "x#{item[:ordered]} #{item[:dish]}      £#{item[:price] * item[:ordered]}"  }
  end 

  def add(dish:, ordered:, price:)
    @contents.push({dish: dish, ordered: ordered, price: price})
    puts added_successfully({dish: dish, ordered: ordered})
  end

  def details
    @contents
  end

  def empty
    @contents = []
    puts emptied_successfully
  end

  private

  def added_successfully(dish:, ordered:)
    "x#{ordered} orders of #{dish} are in your basket :)\n"
  end

  def emptied_successfully
    "emptied basket successfully"
  end
end