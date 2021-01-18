require_relative 'send_sms'
require_relative 'menu'
class TakeawayOrder

  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new.menu
  end

  def add_to_order(dish, quantity)
    raise "Dish not on menu" unless @menu.any? { |item| item[:dish] == dish }

    @basket << { dish: dish, quantity: quantity, unit_price: calculate_unit_price(dish) }
  end

  def calculate_unit_price(dish)
    unit = @menu.select { |item| item[:dish] == dish }
    unit[0][:price]
  end

  def calculate_total
    sum = 0
    basket.each { |dish| sum += (dish[:unit_price] * dish[:quantity]) }
    sum
  end

  def view_order
    [basket, calculate_total]
  end

  def place_order
    confirmation_message
  end

  private

  def confirmation_message
    TextMessage.new.send
  end

end
