class FoodOrder
  attr_accessor :basket, :takeaway_menu
  attr_reader :message

  def initialize(takeaway_menu = Menu.new, message = TextClient.new)
    @basket = []
    @takeaway_menu = takeaway_menu
    @message = message
  end

  def add_dish(dish)
    selection = takeaway_menu.menu.select { |key, _value| key == dish }
    basket << selection
  end

  def total
    sum = 0
    basket.each { |item| item.each_value { |cost| sum += cost } }
    sum
  end

  def correct_total?(price)
    total == price
  end

  def place_order
    raise "You cannot place an order with an empty basket" if basket.empty?
    message.send_text
  end
end
