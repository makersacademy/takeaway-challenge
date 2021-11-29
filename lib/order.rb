require 'dotenv/load'
require 'twilio-ruby'
require 'send_text'

class Order
  attr_reader :items, :total

  def initialize
    @items = []
    @total = 0
  end

  def summary
    @items.each do |item|
      item.each { |name, price| puts "#{name} - £#{price}" }
    end
    total
  end

  def total
    calculate_total
    "Total: #{@total}"
  end

  def complete
    calculate_total
    send_text("Thank you! Your order was placed and will be delivered before #{(Time.now + (60 * 60)).strftime("%k:%M")}.")
  end

  private

  def calculate_total
    @total = @items.reduce(0) { |total, item| total + item.values.last }
  end
end
