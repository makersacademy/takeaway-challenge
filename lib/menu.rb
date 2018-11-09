class Menu
  attr_reader :items

  def initialize()
    @items = {
      "Pizza" => 9,
      "Kebab" => 5,
      "Chips" => 2,
      "Pepsi" => 1
    }
  end

  def show()
    print "\n"
    print "Junk! Menu!\n"
    print "-----------\n"
    @items.each do |key, value|
      print key
      print "   "
      print " £"
      print value
      print "\n"
    end
    print "\n"
  end
end