require_relative 'receipt'
require_relative 'text'
require 'twilio-ruby'
require 'pry'

class Restaurant

  def initialize
    @menu = []
    @one_order = []
  end

  def add_to_menu(item, price)
    @menu << { item => price }
  end

  def list_menu
    @menu.each_with_index do
      |item, index| item.each { |item, price| puts "#{index + 1}. #{item} - £#{price}" }
    end
  end

  def select_meal(num)
    @one_order << @menu[num -1]
  end

  def request_receipt(final_order = Receipt.new)
    final_order.receipt << @one_order
    return "Order complete. Total cost: £#{final_order.receipt[0].map do |i| i.values end.flatten.inject(&:+)}"
    final_order.send_sms
  end

  def start_order
    @one_order = []
    return "Select your meal"
  end

  def send_sms(text = Text.new)
    text.send_sms
  end

  # private

  # # def send_sms
  # #   @text.send_sms
  # # end

end

# binding.pry
