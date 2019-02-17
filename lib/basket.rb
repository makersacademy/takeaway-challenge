class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(item_to_add)
    @basket << item_to_add
  end

  def remove(item_to_remove)

  end

  def total
    @total = []
    @basket.each { |hash| @total << hash[:price].to_f }
    puts "Your current order:"
    puts ""
    @basket.each { |hash| puts hash[:item] }
    print "\nAnd your current total is $#{@total.reduce(:+)}"
  end

end
