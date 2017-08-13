require_relative 'menu'
require_relative 'restaurant'

class Takeaway

  attr_reader :restaurant, :phone_no, :order, :payment_card_no, :order_open
  def initialize(restaurant, phone_no)
    @restaurant = restaurant
    @phone_no = phone_no.to_s
    @order = []
    @payment_card_no = nil
    @order_open = true
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
      puts "#{quantity}x #{item} @ £#{price} each ------- £#{price*quantity}"
      total += price*quantity
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
  end


end

menu11 = Menu.new
menu11.import_menu({"pizza" => 6, "kebab" => 5})
pizza = Restaurant.new("Pizza", menu11)
p pizza.display_menu
p pizza
take=Takeaway.new(pizza,"07767892911")
take.select_dish("pizza")
take.select_dish("kebab")
take.select_dish("pizza",2)
take.show_basket
