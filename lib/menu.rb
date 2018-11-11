class Menu
  attr_reader :items

  def initialize(items={"Pizza" => 9,"Kebab" => 5,"Chips" => 2,"Pepsi" => 1})
    @items = items
  end

  def show()
    print "\nJunk! Menu!\n-----------\n"
    items.each do |key, value|
      print "#{key}    £#{value}\n"
    end
    print "\n"
  end
end