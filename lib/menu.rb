require "send_sms"

class Takeaway
  attr_reader :order
  attr_reader :menu
  attr_reader :message

  def initialize
    @menu = {
      "Baba Ganoush" => 4,
      "Donut" => 2,
      "Entire wheel of cheese" => 10,
      "Distended stomach" => 7,
      "Diet culture guilt trip" => 0,
      "Your usual" => 5
    }
    @order = {}
    @message = message
  end

  def print_menu
    @menu.each { |k, v| puts "#{k}   #{v}"}
  end

  def select_dish(k)
    if @menu.has_key?(k)
      v = @menu.fetch(k)
      @order.store(k, v)
    end
  end

  def total
    total = 0
    @order.each_value {|value| total += value}
    total
  end

  def order_summary
    @order.each do |k, v|
      puts "#{k} £#{v}"
    end
    print "Total £#{total}"
  end

  def confirm_order
    puts @message
  end
end
