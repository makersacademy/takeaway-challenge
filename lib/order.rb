require_relative 'SMS_alert.rb'

class Order

  attr_reader :basket

  MENU = {pizza: 10,
          ice_cream: 5.55,
          garlic_bread: 2.99}

  def initialize(sms_Klass)
    @basket = Hash.new(0)
    @sms = sms_Klass
  end

  def menu
    MENU
  end

  def add_to_basket(item, number = 1)
    fail "Sorry, we don't have #{item}" if !MENU.has_key?(item.to_sym)
    basket[item.to_sym] += number
  end

  def total
    basket.keys.map do |food|
      MENU[food]*basket[food]
    end.reduce(:+)
  end

  def checkout(price)
    fail "Sorry, that was not the correct total" if price != total
    sms.send_message
  end

  private

  attr_reader :sms
  attr_writer :basket

end
