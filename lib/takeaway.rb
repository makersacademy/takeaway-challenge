
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

  def place_order(dish, number=1)
    number.times do
      self.order << dish
    end
    return "#{number}x #{dish} added to basket"
  end

  def sum
    
  end


end
