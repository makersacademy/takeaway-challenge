class Menu
  attr_reader :items
  def initialize
    @items = {
      "veg curry"=>8.00,
      "chickpea curry"=>7.50,
      "tarka dahl"=>7.00,
      "bindi bhaji"=>4.50,
      "brinjal bhaji"=>5.00,
      "sag aloo"=>4.50,
      "onion bhaji"=>4.50,
      "veg samosa"=>4.25,
      "popadoms"=>3.50,
      "paratha"=>2.75,
      "chapati"=>2.25,
      "rice"=>3.00
    }
  end
  def show
    display_header
    display_items
  end
  def has?(item)
    items.key?(item)
  end
  def price(item)
    items[item]
  end

  private
  def display_header
    print "\nTAKEAWAY MENU\n\n"
    printf("%-20s %8s \n", "ITEM", "PRICE")
  end
  def display_items
    items.each { |k,v| printf("%-20s %8.2f\n",k,v) }
    print "\n"
  end
end
