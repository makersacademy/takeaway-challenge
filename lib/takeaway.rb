
class TakeAway

  attr_reader :basket, :total

  def initialize(dish_class=Dish, order_confirmation_class=OrderConfirmation)
    @dish_class = dish_class
    @order_confirmation_class = order_confirmation_class.new
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
    raise error_message if total_received != total
    text_message = "Thank you for your order. You've paid £#{total}. Your food will arrive in 40-60m."
    @order_confirmation_class.send_sms(text_message)
  end

  def total
    @basket.each_index do |dish|
      self.basket[dish].price
      @total = @basket[dish].price * @basket[dish].quantity
    end
    @total
  end

end
