class FoodOrder
  attr_accessor :basket, :takeaway_menu
  attr_reader :message

  def initialize(takeaway_menu = Menu.new, message = Message.new)
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
    message.send_message
  end
end
