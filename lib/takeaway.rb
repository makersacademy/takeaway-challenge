require_relative 'menu'
require_relative 'restaurant'
require_relative 'texting'

class Takeaway

  attr_reader :restaurant, :phone_no, :order, :payment_card_no, :order_open
  attr_accessor :texter
  def initialize(restaurant, phone_no)
    @confirmation =
    @restaurant = restaurant
    @phone_no = phone_no.gsub(/^0/, "44").to_i
    @order = []
    @payment_card_no = nil
    @order_open = true
    max_time = (Time.now + 3600).strftime("%H:%M")
    @message = "Thanks for your order, your food will be with you by #{max_time}"
    @texter = Texting.new
  end

  def read_menu
    @restaurant.display_menu
  end

  def select_dish(dish, quantity = 1)
    quantity.times do
      @order << dish
    end
  end

  def show_basket
    total = 0
    @order.uniq.each do |item|
      quantity = @order.count(item)
      price = @restaurant.menu.list[item]
      puts "#{quantity}x #{item} @ £#{price} each ------- £#{price * quantity}"
      total += price * quantity
    end
    puts "Total = £#{total}"
  end

  def checkout(card_no = nil)
    raise "Order now closed" if @order_open == false
    raise "Payment card details required" if card_no.nil?
    raise "Basket empty - cannot checkout" if @order.empty?
    puts "Your final order is:"
    show_basket
    @payment_card_no = card_no
    @order_open = false
    texter.send_text("+#{@phone_no}", @message)
  end

end
