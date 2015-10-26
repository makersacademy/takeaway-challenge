class Menu
  attr_reader :items

  ITEMS = {"Chips"         => 0.89,
           "Chicken Tikka" => 3.99,
           "Burger"        => 2.99,
           "Pizza"         => 1.99,
           "Wrap"          => 1.49
          }
  def initialize (items=ITEMS)
    @items = items
  end

  def show_menu
    @items.map {|item, price| "#{item} - #{format('£%.2f', price)}"}
  end

  def can_order?(dish)
    @items.key?(dish)
  end

end
