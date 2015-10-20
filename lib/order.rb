require_relative 'menu'

class Orders

attr_reader :order, :message, :text

  def initialize
    @order = []
    @text = Text.new
  end

  def add_menu_item_to_order(item, number=1)
    @order << [item, number, number *item.price]
  end

  def total_dishes
  total_dishes = []
    order.each do |item|
      total_dishes <<item[1]
    end
  total_dishes.inject(:+)
  end

  def show_order
    @order.each do |item|
    end
  end

  def total
    total = []
    order.each do |item|
      total<<item[2]
    end
    total_order = total.inject(:+)
  end

  def correct(customer_happy)
   fail "Order Total incorrect" if customer_happy != "Yes"
   "Thank you for you order - you will receive a text message shortly confirming when your order will be delivered"
  end

  def delivery_time
    time = Time.now + 30*60
  end

  def text_order_confirmation(number)
    text.send_text(number, "your order will be with you in #{self.delivery_time} mins")
  end
end
