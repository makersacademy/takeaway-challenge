class FoodOrder
  attr_accessor :basket, :takeaway_menu, :total_order
  attr_reader :message

  def initialize(takeaway_menu = Menu.new, message = TextClient.new)
    @basket = []
    @takeaway_menu = takeaway_menu
    @message = message
    @total_order = 0
  end

  def add_dish(dish)
    selection = takeaway_menu.menu.select { |key, _value| key == dish }
    basket << selection
  end

  def total
    basket.each { |item| item.each_value { |cost| self.total_order += cost } }
    "Your total order is £%0.2f" % [total_order]
  end

  def correct_total?(price)
    total_order.round(2) == price.round(2)
  end

  def place_order
    raise "You cannot place an order with an empty basket" if basket.empty?
    message.send_text
  end
end
