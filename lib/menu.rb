class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "Margherita"=> 7.00, "Pepperoni"=> 7.50,
      "Ham & Pineapple"=> 7.50, "Vegetarian"=> 7.00,
      "Meat Feast"=> 8.00, "Chicken Supreme"=> 8.00,
      "Veggie Supreme"=> 8.00, "Ham & Mushroom"=> 7.25
    }
  end

  def readable_menu
    @dishes.map {|item, price| "#{item} pizza : £#{'%.2f' % price}"}.join(", ")
  end

  def item_on_menu?(item)
    @dishes.include?(item)
  end

end
