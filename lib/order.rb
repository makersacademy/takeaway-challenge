require_relative './restaurant.rb'
require_relative './checkout.rb'

class Order

  attr_reader :menu, :selection, :provided_total

  def initialize(restaurant = Restaurant.new)
    @menu = restaurant.menu
    @selection = {}
  end

  def add(item, quantity)
    item_sym = item.to_sym
    raise "Item not on menu" unless @menu.has_key?(item_sym)
    @selection[item_sym] += quantity if @selection.has_key?(item_sym)
    @selection[item_sym] = quantity unless @selection.has_key?(item_sym)
    string_formatter(item, quantity)
  end

  def basket_summary
    raise "Basket empty" if @selection.empty?
    @selection.to_a
      .map { |arr| string_formatter(arr[0], arr[1]) }
      .join(", ")
  end

  def checkout(provided_total, phone_number, checkout_class = Checkout)
    validate(provided_total)
    checkout_class.new(provided_total, phone_number)
  end

  def send_sms(messaging_service, phone_number)
    messaging_service.send_sms(phone_number, sms_body)
  end

  private

  def validate(provided_total)
    raise "Incorrect total provided" unless calculated_total == provided_total
  end

  def calculated_total
    @selection.map { |item, amount| amount * menu[item] }.inject(&:+)
  end

  def string_formatter(item, quantity)
    "#{quantity} x #{item} = £#{quantity * @menu[item.to_sym]}"
  end

end
