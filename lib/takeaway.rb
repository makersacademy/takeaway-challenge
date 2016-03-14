class TakeAway

  attr_reader :basket, :total

  def initialize(dish_class=Dish)
    @dish_class = dish_class
    @basket = []
  end

  def list_menu
    menu = {"Bratwurst in a bun" => 2.49,
      "Bockwurst in a bun" => 2.49,
        "Käsekrainer in a bun" => 2.79,
        "Veggie sausage in a bun" => 2.29,
        "Sauerkraut" => 1.19,
        "Crispy onions" => 0.29,
        "Mustard" => 0.29,
        "Ketchup" => 0.29,
        "Sidesalad" => 0.75,
        "Orange juice" => 1.49,
        "Weißbier" => 2.99,
        "Schwarzbier" => 2.99
      }
  end

  def add_to_basket(dish,quantity)
    price = self.list_menu[dish]
    @basket << @dish_class.new(dish,price,quantity)
  end

  def order(total_received)
    error_message = 'Total received doesn\'t match total price'

    raise error_message if total_received != @total
    'Send text'
  end

  def text_message
    @text_message =
    "Thank you for your order. You've paid £#{total}.
    Your food will arrive in 40-60m."
  end

  private

  def takeaway_total
    self.basket.each_index do |item|
      @total = self.basket[item].price * self.basket[item].quantity
    end
    total
  end


end
