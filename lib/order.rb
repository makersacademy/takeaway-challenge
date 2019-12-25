require 'dotenv'
require_relative 'menu'
require_relative 'send_sms'
require_relative 'fake_sms'
Dotenv.load('sensitive.env')

class Order

  attr_reader :menu, :selections

  def initialize(menu)
    @menu = menu.items
    @menu.each { |food, price| puts "#{food.capitalize}: £#{price}" }
    @selections = []
  end

  def selection
    puts "What would you like to order?"
    until choice.nil?
      puts "If you would like another item(s), please enter them now\nReturn once to begin checkout"
    end
    print_selection
    raise_error
    send_sms(ENV["TEST_SID"], ENV["TEST_TOKEN"], ENV["TEST_OUTBOUND"], ENV["TEST_INBOUND"], FakeSMS)
  end

  def choice 
    choice = STDIN.gets.chomp!
    @selections << choice.to_sym if !choice.nil? && @menu.include?(choice.to_sym)  
  end

  def print_selection
    @total = 0
    @selections.each { |item| @total += @menu[item] 
  puts "#{item.capitalize}: £#{@menu[item]}" 
    }
    puts "Total: £#{@total}"
  end

  def send_sms(sid, token, outbound, inbound, sms = SendSMS)
    sms = sms.new(sid, token, outbound, inbound)
    sms.send(to_print)
  end

  def to_print
    @selections.map { |item| item.to_s.capitalize }
  end

private

  def raise_error
    raise "Totals do not match" if @selections.sum { |item| @menu[item] } != @total

    puts "Total is correct"
  end

end
