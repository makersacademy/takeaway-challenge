require 'menu'

class Order
  def initialize(*choice, quantities, user_total)
    @choice = choice
    @quantities = quantities
    @user_total = user_total
    @menu = Menu.new
  end

  def calculate_price
    convert_dishes_to_prices
    @price = (@prices.zip(@quantities)).map { |x, y| x * y }
    @price.sum
  end

  def convert_dishes_to_prices
    @prices = []
    @choice.each { |food| @prices << @menu.menu[food] }
  end

  def verified?
    calculate_price == @user_total
    send_text
  end

  private

  def send_text
    new_text = Text.new
    new_text.send
  end
end
