require_relative 'menu'
require_relative 'basket'
require_relative 'texter'

class Takeaway
  def initialize(menu = Menu.new, basket = Basket.new, texter = Texter.new)
    @menu = menu
    @basket = basket
    @texter = texter
  end

  def show_menu
    @menu.display
  end

  def order(dish, quantity = 1)
    name = dish.downcase
    if @menu.has?(name)
      price = @menu.price(name)
      @basket.store(name, quantity, price)
      "#{quantity} x #{name} has been added to your basket"
    else
      "Sorry! We don't have what you've just ordered. Check the menu for what's on offer!"
    end
  end

  def basket_summary
    @basket.show_basket
  end

  def show_total
    "Total: £#{'%.2f' % total}"
  end

  def checkout(price)
    if correct_amount?(price)
      complete_order(price)
    else
      "Sorry that is not the right amount, please try again."
    end
  end

  private
  def complete_order(_price)
    time = (Time.new + 2400).strftime("%I:%M %p")
    @texter.send_text("Thank you for your payment! Your delivery will arrive before #{time}")
  end

  def total
    @basket.total
  end

  def correct_amount?(num)
    num == total
  end
end
