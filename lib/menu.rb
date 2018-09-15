class Menu
  LIST = [
    { name: "Fish and Chips", price: 1295 },
    { name: "Roast Dinner",   price: 1495 },
    { name: "Avocado Toast",  price: 1995 },
    ]

  attr_reader :list

  def initialize(list = LIST)
    @list = list
  end

  def display
    list.each do |dish|
      print "\u2022 "
      print dish[:name].ljust(20, ' ')
      puts "£" + "%.2f" % (dish[:price]/100.00)
    end
  end
end
