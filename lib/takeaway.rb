
class Takeaway

  attr_reader :menu
  attr_accessor :order

  def initialize
    @order = []
    @menu = {
      'Margherita' => 6.00,
      'Napoli' => 6.70,
      'Venezia' => 6.70,
      'Sorrento' => 6.70,
      'Athena' => 8.20,
      'Meat Feast' => 8.70,
      'Extra toppings' => 0.80
    }
  end

  def add_to_basket(dish)
    self.order << dish
    return "One #{dish} added to basket"
  end

end
