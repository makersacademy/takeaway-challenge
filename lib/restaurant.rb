class Restaurant

  attr_reader :basket

  def initialize
    @menu = { 'spring_rolls' => 1.99, 'prawn_toast' => 1.99,
       'egg_fried_rice' => 2.50, 'kung_po_chicken' => 4.50 }
    @basket = {}
  end

  def read_menu
    @menu
  end

  def order(dish, number = 1)
    @basket[dish] = number
  end
end
