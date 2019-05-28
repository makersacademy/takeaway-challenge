require 'basket'
require 'text_sender'

class Takeaway

  def initialize(basket_class = Basket, text_class = TextSender)
    @basket = basket_class.new
    @text_sender = text_class.new
  end

  def show_menu
    @basket.show_menu
  end

  def add_to_basket(dish_choice, amount)
    @basket.add_item(dish_choice, amount)
  end

  def checkout(expected_price)
    raise "Price given is not equal to actual price" unless correct_price?(expected_price)
    
    @text_sender.send_message
  end

  def retrieve_basket
    @basket.basket
  end

  def retrieve_cost
    @basket.total_cost
  end

  def correct_price?(expected_price)
    retrieve_cost == expected_price
  end

end
