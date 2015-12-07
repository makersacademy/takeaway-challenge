require_relative 'sms_notificaiton'
require_relative 'menu'

class Takeaway
  attr_accessor :food
  attr_reader :current_order, :order_total, :order_summary

  def initialize(menu_klass = Menu.new, sms_notification_klass = SmsNotification.new)
    @menu_klass = menu_klass
    @food = {margareta: 4, hawaiian: 5}
    @current_order = {}
    @order_total = 0
    @sms_notification_klass = sms_notification_klass
    # @order_summary = ""
  end

  def cuisine(cuisine)
    @food = @menu_klass.send cuisine
  end

  def menu
    food.each { |food, price| puts "#{food} : £#{price}" }
  end

  def select_dish(dish, quantity=1)
    fail 'Sorry this is an invalid dish if you havent, please load a cuisine' unless valid_dish?(dish)
    current_order[dish] = quantity
    add_to_total(dish, quantity)
    # order_summary << "Item: #{dish} Price: #{food[:dish]} Quantity: #{quantity} \n"
  end

  def confirm_order
    puts "Please confirm you order total of #{order_total}? (yes/no)"
    input = gets.chomp
    if input == "yes"
      @sms_notification_klass.order
    else
      "order confirmation cancelled"
    end
  end

  private

  def valid_dish?(dish)
    food.include?(dish)
  end

  def add_to_total(dish, quantity)
    @order_total = @order_total + (food[dish]) * quantity
  end



end
